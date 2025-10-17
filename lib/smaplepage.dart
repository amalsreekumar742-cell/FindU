import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> posts = [
    {"id": 1, "title": "Sunset view", "image": "https://picsum.photos/300?1"},
    {"id": 2, "title": "Beach vibes", "image": "https://picsum.photos/300?2"},
    {"id": 3, "title": "Mountain peak", "image": "https://picsum.photos/300?3"},
  ];

  // stores IDs of saved posts
  List<int> savedPosts = [];

  void toggleSave(int postId) {
    setState(() {
      if (savedPosts.contains(postId)) {
        savedPosts.remove(postId);
      } else {
        savedPosts.add(postId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(
        posts: posts,
        savedPosts: savedPosts,
        onSaveToggle: toggleSave,
      ),
      SavedScreen(
        posts: posts.where((p) => savedPosts.contains(p["id"])).toList(),
        onSaveToggle: toggleSave,
      ),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline), label: "Saved"),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts;
  final List<int> savedPosts;
  final Function(int) onSaveToggle;

  const HomeScreen({
    super.key,
    required this.posts,
    required this.savedPosts,
    required this.onSaveToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          final isSaved = savedPosts.contains(post["id"]);

          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(post["image"], fit: BoxFit.cover),
                ListTile(
                  title: Text(post["title"]),
                  trailing: IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? Colors.black : Colors.grey,
                    ),
                    onPressed: () => onSaveToggle(post["id"]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SavedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts;
  final Function(int) onSaveToggle;

  const SavedScreen({
    super.key,
    required this.posts,
    required this.onSaveToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved Posts")),
      body: posts.isEmpty
          ? const Center(child: Text("No saved posts yet"))
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(post["image"], fit: BoxFit.cover),
                      ListTile(
                        title: Text(post["title"]),
                        trailing: IconButton(
                          icon: const Icon(Icons.bookmark, color: Colors.black),
                          onPressed: () => onSaveToggle(post["id"]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
