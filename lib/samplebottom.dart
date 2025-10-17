import 'package:flutter/material.dart';
import 'package:flutter_application_1/samplehome.dart';
import 'package:flutter_application_1/samplesaved.dart';


class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  // Shared saved post IDs
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
    final pages = [
      HomePage(savedPosts: savedPosts, onSaveToggle: toggleSave),
      SavedPage(savedPosts: savedPosts, onSaveToggle: toggleSave),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
        ],
      ),
    );
  }
}
