import 'package:flutter/material.dart';
import 'package:flutter_application_1/page3.dart';

class CourseDetailPage extends StatefulWidget {
  final String title;
  final String teacher;
  final String image;
  final String duration;
  final String review;
  final String amount;

  const CourseDetailPage({
    super.key,
    required this.title,
    required this.teacher,
    required this.image,
    required this.duration,
    required this.review,
    required this.amount,
  });

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  List<Map<String, String>> savedCourses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Image with fallback
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: widget.image.isNotEmpty
                  ? Image.network(widget.image,
                      height: 200, width: double.infinity, fit: BoxFit.cover)
                  : Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Center(child: Text("No Image")),
                    ),
            ),

            const SizedBox(height: 16),

            Text(widget.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Instructor: ${widget.teacher}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("Duration: ${widget.duration}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("Rating: ${widget.review}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("Price: ${widget.amount}",
                style: const TextStyle(fontSize: 16, color: Colors.blueAccent)),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page33(
                      onSaveToggle: (course) {
                        setState(() {
                          if (!savedCourses
                              .any((c) => c["title"] == course["title"])) {
                            savedCourses.add(course);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text("${course["title"]} saved!")),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      "${course["title"]} already saved!")),
                            );
                          }
                        });
                      },
                    ),
                  ),
                );
              },
              child: const Text("View More Details"),style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
