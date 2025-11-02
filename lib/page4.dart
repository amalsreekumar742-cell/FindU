import 'package:flutter/material.dart';

// Saved Page
class SavedPage extends StatelessWidget {
  final List<Map<String, String>> savedCourses;
  final Function(Map<String, String>) onUnsave;

  const SavedPage({super.key, required this.savedCourses, required this.onUnsave});

  @override
  Widget build(BuildContext context) {
    if (savedCourses.isEmpty) {
      return const Center(child: Text("No saved courses yet."));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: savedCourses.length,
      itemBuilder: (context, index) {
        final course = savedCourses[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.network(
              course["image"] ?? "",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(course["title"] ?? ""),
            subtitle: Text(course["teacher"] ?? ""),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onUnsave(course),
            ),
          ),
        );
      },
    );
  }
}

// Main Page11 with Featured Courses and bookmark functionality
class Page11 extends StatelessWidget {
  final Function(Map<String, String>) onSaveToggle;

  Page11({super.key, required this.onSaveToggle});

  final List<Map<String, dynamic>> courses = [
    {
      "title": "iOS Developer",
      "teacher": "Rahul",
      "image": "https://images.pexels.com/photos/1181244/pexels-photo-1181244.jpeg",
      "duration": "1 hr",
      "review": "4/5",
      "amount": "\$23",
    },
    {
      "title": "Data Science",
      "teacher": "Sneha",
      "image": "https://images.pexels.com/photos/3861957/pexels-photo-3861957.jpeg",
      "duration": "1 hr",
      "review": "5/5",
      "amount": "\$20",
    },
    {
      "title": "MERN Stack",
      "teacher": "Ankit",
      "image": "https://images.pexels.com/photos/1181671/pexels-photo-1181671.jpeg",
      "duration": "1 hr",
      "review": "3/5",
      "amount": "\$26",
    },
    {
      "title": "Flutter developer",
      "teacher": "Rahul",
      "image": "https://cdn.prod.website-files.com/646497e9af65ec660cdb5328/65d8c2bc53691cc47bc5064f_Cover_Flutter.webp",
      "duration": "1 hr",
      "review": "4/5",
      "amount": "\$25",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        const Text("Featured Courses",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            itemBuilder: (context, index) => featuredCard(context, index),
          ),
        ),
      ],
    );
  }

  Widget featuredCard(BuildContext context, int index) {
    final course = courses[index];

    return InkWell(
      onTap: () {
        // Navigate to course detail if needed
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.blue.withOpacity(0.2),
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  course["image"],
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  course["title"] ?? "No Title",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Duration, Review, Amount + Bookmark
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.timer_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(course["duration"] ?? ""),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(course["review"] ?? ""),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.bookmark, color: Colors.blueAccent),
                      onPressed: () {
                       final courseMap = <String, String>{
  "title": course["title"]?.toString() ?? "",
  "teacher": course["teacher"]?.toString() ?? "",
  "image": course["image"]?.toString() ?? "",
};
onSaveToggle(courseMap);

                        onSaveToggle(courseMap);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Example parent widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> savedCourses = [];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      Page11(onSaveToggle: (course) {
        setState(() {
          if (!savedCourses.any((c) => c["title"] == course["title"])) {
            savedCourses.add(course);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${course["title"]} saved!")));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${course["title"]} already saved!")));
          }
        });
      }),
      SavedPage(
          savedCourses: savedCourses,
          onUnsave: (course) {
            setState(() {
              savedCourses.removeWhere((c) => c["title"] == course["title"]);
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${course["title"]} removed!")));
          }),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("FindU")),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
        ],
      ),
    );
  }
}
