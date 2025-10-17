import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  final List<int> savedPosts;
  final Function(int) onSaveToggle;

  const SavedPage({
    super.key,
    required this.savedPosts,
    required this.onSaveToggle,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> allPosts = [
      {"id": 1, "title": "Sunset", "image": "https://picsum.photos/400?1"},
      {"id": 2, "title": "Beach", "image": "https://picsum.photos/400?2"},
      {"id": 3, "title": "Mountains", "image": "https://picsum.photos/400?3"},
    ];

    final List<Map<String, dynamic>> savedItems =
        allPosts.where((post) => savedPosts.contains(post["id"] as int)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Saved Posts")),
      body: savedItems.isEmpty
          ? const Center(child: Text("No saved posts yet"))
          : ListView.builder(
              itemCount: savedItems.length,
              itemBuilder: (context, index) {
                final post = savedItems[index];
                final String imageUrl = post["image"] as String;
                final String title = post["title"] as String;
                final int id = post["id"] as int;

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(imageUrl, fit: BoxFit.cover),
                      ListTile(
                        title: Text(title),
                        trailing: IconButton(
                          icon: const Icon(Icons.bookmark, color: Colors.black),
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
