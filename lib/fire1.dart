import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/video.dart'; 

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<Map<String, dynamic>> courses = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      List<Map<String, dynamic>> fetchedCourses = [];

      // Fetch all categories
      QuerySnapshot categorySnapshot = await firestore.collection('categories').get();

      for (var categoryDoc in categorySnapshot.docs) {
        String categoryName = categoryDoc.id;

        // Fetch courses under this category
        QuerySnapshot courseSnapshot = await firestore
            .collection('categories')
            .doc(categoryName)
            .collection('courses')
            .get();

        for (var courseDoc in courseSnapshot.docs) {
          Map<String, dynamic> courseData = courseDoc.data() as Map<String, dynamic>;
          courseData['id'] = courseDoc.id;
          courseData['category'] = categoryName;

          // Fetch sections
          QuerySnapshot sectionSnapshot = await firestore
              .collection('categories')
              .doc(categoryName)
              .collection('courses')
              .doc(courseDoc.id)
              .collection('sections')
              .get();

          List<Map<String, dynamic>> sections = [];

          for (var sectionDoc in sectionSnapshot.docs) {
            Map<String, dynamic> sectionData = sectionDoc.data() as Map<String, dynamic>;
            sectionData['id'] = sectionDoc.id;

            // Fetch videos for this section
            QuerySnapshot videoSnapshot = await firestore
                .collection('categories')
                .doc(categoryName)
                .collection('courses')
                .doc(courseDoc.id)
                .collection('sections')
                .doc(sectionDoc.id)
                .collection('videos')
                .get();

            List<Map<String, dynamic>> videos =
                videoSnapshot.docs.map((v) => v.data() as Map<String, dynamic>).toList();

            sectionData['videos'] = videos;
            sections.add(sectionData);
          }

          // ✅ Manual sort: ensure "Introduction" comes first
          sections.sort((a, b) {
            if (a['title'] == 'Introduction') return -1;
            if (b['title'] == 'Introduction') return 1;
            return 0; // keep other order as is
          });

          courseData['sections'] = sections;
          fetchedCourses.add(courseData);
        }
      }

      setState(() {
        courses = fetchedCourses;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = "Error fetching courses: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text("Courses")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (error.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Courses")),
        body: Center(child: Text(error)),
      );
    }

    if (courses.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Courses")),
        body: const Center(child: Text("No courses available.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Courses")),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          final image = course['image'] ?? '';
          final title = course['title'] ?? 'Untitled Course';
          final teacher = course['teacher'] ?? 'Unknown';
          final sections =
              List<Map<String, dynamic>>.from(course['sections'] ?? []);

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              leading: image.isNotEmpty
                  ? Image.network(image, width: 60, height: 60, fit: BoxFit.cover)
                  : const Icon(Icons.image_not_supported, size: 60),
              title: Text(title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              subtitle: Text("Teacher: $teacher"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoApps(
                      val1: title,
                      val2: image,
                      val3: teacher,
                      sections: sections,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
