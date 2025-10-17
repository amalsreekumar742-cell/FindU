// import 'package:flutter/material.dart';

// class SavedPage extends StatelessWidget {
//   final List<Map<String, String>> savedCourses;

//   const SavedPage({super.key, required this.savedCourses});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Saved Courses")),
//       body: savedCourses.isEmpty
//           ? const Center(child: Text("No saved courses yet"))
//           : ListView.builder(
//               itemCount: savedCourses.length,
//               itemBuilder: (context, index) {
//                 final course = savedCourses[index];
//                 return Card(
//                   elevation: 3,
//                   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                   child: Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           bottomLeft: Radius.circular(15),
//                         ),
//                         child: Image.network(
//                           course["image"] ?? "",
//                           height: 100,
//                           width: 100,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) =>
//                               const Icon(Icons.broken_image, size: 80),
//                         ),
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 course["title"] ?? "Untitled Course",
//                                 style: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 course["teacher"] ?? "Unknown Instructor",
//                                 style: TextStyle(
//                                     color: Colors.grey[700], fontSize: 14),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  final List<Map<String, String>> savedCourses;
  final Function(Map<String, String>) onUnsave;

  const SavedPage({super.key, required this.savedCourses, required this.onUnsave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved Courses")),
      body: savedCourses.isEmpty
          ? const Center(child: Text("No saved courses yet"))
          : ListView.builder(
              itemCount: savedCourses.length,
              itemBuilder: (context, index) {
                final course = savedCourses[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(course["image"]!, width: 60, fit: BoxFit.cover),
                    title: Text(course["title"]!),
                    subtitle: Text(course["teacher"]!),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => onUnsave(course),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
