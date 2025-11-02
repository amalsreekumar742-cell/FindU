import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:string_similarity/string_similarity.dart';


// ---------------------------------------------------------------------
// 1. Data model
// ---------------------------------------------------------------------
class QA {
  final String question;
  final String answer;
  QA({required this.question, required this.answer});

  factory QA.fromJson(Map<String, dynamic> json) {
    return QA(
      question: json['question']?.toString() ?? '',
      answer: json['answer']?.toString() ?? '',
    );
  }
}

// ---------------------------------------------------------------------
// 2. Chat screen
// ---------------------------------------------------------------------
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<QA> _qaList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  // -------------------------------------------------
  // Load JSON from assets
  // -------------------------------------------------
  Future<void> _loadContent() async {
    try {
      final String jsonStr = await rootBundle.loadString('asset/content.json');
      final List<dynamic> data = jsonDecode(jsonStr);
      setState(() {
        _qaList = data.map((e) => QA.fromJson(e)).toList();
        _loading = false;
      });
      _addBotMessage('Hi! Ask me anything about the app.');
    } catch (e) {
      setState(() => _loading = false);
      _addBotMessage('Error loading data. Check assets/content.json');
    }
  }

  // -------------------------------------------------
  // Send user message
  // -------------------------------------------------
  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();

    setState(() => _messages.add(ChatMessage(text: text, isUser: true)));
    _scrollToBottom();

    // Find best answer
    final best = _findBestAnswer(text);
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() => _messages.add(ChatMessage(text: best, isUser: false)));
      _scrollToBottom();
    });
  }

  // -------------------------------------------------
  // Fuzzy search (threshold 0.4 = 40% similarity)
  // -------------------------------------------------
  String _findBestAnswer(String query) {
    if (_qaList.isEmpty) return "I don't have any information yet.";

    double bestScore = 0.0;
    String bestAnswer = "Sorry, I couldn't find an answer for that.";

    for (final qa in _qaList) {
      final similarity = qa.question.similarityTo(query);
      if (similarity > bestScore && similarity > 0.4) {
        bestScore = similarity;
        bestAnswer = qa.answer;
      }
    }
    return bestAnswer;
  }

  void _addBotMessage(String text) {
    setState(() => _messages.add(ChatMessage(text: text, isUser: false)));
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Findu Chatbot')),
      body: Column(
        children: [
          if (_loading) const LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (_, i) => ChatBubble(message: _messages[i]),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ask a question...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: _send),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------
// 3. UI widgets
// ---------------------------------------------------------------------
class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.indigo : Colors.grey[200],
          borderRadius: BorderRadius.circular(18),
        ),
        constraints: const BoxConstraints(maxWidth: 280),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}