import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<int> savedPosts;
  final Function(int) onSaveToggle;

  const HomePage({
    super.key,
    required this.savedPosts,
    required this.onSaveToggle,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ Explicitly typed list to avoid dynamic issues
    final List<Map<String, dynamic>> posts = [
      {"id": 1, "title": "Sunset", "image": "https://picsum.photos/400?1"},
      {"id": 2, "title": "Beach", "image": "https://picsum.photos/400?2"},
      {"id": 3, "title": "Mountains", "image": "https://picsum.photos/400?3"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          // ✅ Safely cast values
          final int id = post["id"] as int;
          final String title = post["title"] as String;
          final String imageUrl = post["image"] as String;

          final bool isSaved = savedPosts.contains(id);

          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(imageUrl, fit: BoxFit.cover),
                ListTile(
                  title: Text(title),
                  trailing: IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? Colors.black : Colors.grey,
                    ),
                    onPressed: () => onSaveToggle(id),
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
