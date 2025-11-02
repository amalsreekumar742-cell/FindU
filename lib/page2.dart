import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Page22 extends StatefulWidget {
  const Page22({super.key});

  @override
  State<Page22> createState() => _Page22State();
}

class _Page22State extends State<Page22> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> allCourses = [];
  List<Map<String, dynamic>> filteredCourses = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAllCourses();
  }

  Future<void> fetchAllCourses() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final categoriesSnapshot = await firestore.collection('categories').get();

      List<Map<String, dynamic>> loadedCourses = [];

      for (var categoryDoc in categoriesSnapshot.docs) {
        final coursesSnapshot = await categoryDoc.reference
            .collection('courses')
            .get();

        for (var courseDoc in coursesSnapshot.docs) {
          final data = courseDoc.data();
          loadedCourses.add({
            'category': categoryDoc.id,
            'title': data['title'] ?? 'No Title',
            'teacher': data['teacher'] ?? 'Unknown Instructor',
            'image': data['image'] ?? '',
          });
        }
      }

      setState(() {
        allCourses = loadedCourses;
        filteredCourses = loadedCourses;
        isLoading = false;
      });
    } catch (e) {
      print("❌ Error fetching courses: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  /// 🔎 Filter courses based on query
  void _filterCourses(String query) {
    final results = allCourses.where((course) {
      final title = course['title'].toString().toLowerCase();
      final teacher = course['teacher'].toString().toLowerCase();
      final category = course['category'].toString().toLowerCase();
      return title.contains(query.toLowerCase()) ||
          teacher.contains(query.toLowerCase()) ||
          category.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredCourses = results;
    });
  }

  /// Quick search buttons
  void _searchByKeyword(String keyword) {
    searchController.text = keyword;
    _filterCourses(keyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Search Courses"),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 13,),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: "Search for a course",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _filterCourses,
            ),
          ),

          // Top Searches
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Top Searches",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                "Flutter",
                "Photography",
                "Marketing",
                "Sales",
                "Design",
                "Excel",
              ].map((topic) {
                return OutlinedButton(
                  onPressed: () => _searchByKeyword(topic),
                  child: Text(topic),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 10),

          // Results
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredCourses.isEmpty
                    ? const Center(
                        child: Text(
                          "No courses found 😕",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredCourses.length,
                        itemBuilder: (context, index) {
                          final course = filteredCourses[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: course['image'].isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        course['image'],
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Icon(Icons.book, size: 40),
                              title: Text(
                                course['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Text(
                                "${course['teacher']} • ${course['category']}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              onTap: () {
                                // 👉 Navigate to course details or video player page here
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (_) => VideoApps(
                                //     val1: course['title'],
                                //     val2: course['image'],
                                //     val3: course['teacher'],
                                //     sections: [],
                                //   ),
                                // ));
                              },
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
