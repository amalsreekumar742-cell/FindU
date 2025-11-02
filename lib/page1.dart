
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/featuredCourse.dart';
// import 'package:flutter_application_1/page3.dart';
// import 'package:flutter_application_1/payment.dart';
// import 'package:flutter_application_1/video.dart';

// class Page11 extends StatelessWidget {
//   final Function(Map<String, String>) onSaveToggle;

//   Page11({super.key, required this.onSaveToggle});

//   // Featured courses
//   final List<String> imgFeatured = [
//     "https://cdn.geekboots.com/geek/ios-app-meta-1670401648275.jpg",
//     "https://www.mygreatlearning.com/blog/wp-content/uploads/2019/09/What-is-data-science-2.jpg",
//     "https://i0.wp.com/blog.apitier.com/wp-content/uploads/2023/02/MERN_Stack.jpg?fit=560%2C315&ssl=1",
//     "https://cdn.prod.website-files.com/646497e9af65ec660cdb5328/65d8c2bc53691cc47bc5064f_Cover_Flutter.webp",
//   ];
//   final List<String> dataFeatured = ["iOS Developer", "Data Science", "MERN Stack"];
//   final List<String> dura = ["1 hr", "1.2 hr", "1.1 hr"];
//   final List<String> reviews = ["4/5", "5/5", "3/5"];
//   final List<String> amt = ["\$10", "\$20", "\$30"];

//   final List<Map<String, dynamic>> courses = [
//     {
//       "title": "iOS Developer",
//       "teacher": "Rahul",
//       "image": "https://images.pexels.com/photos/1181244/pexels-photo-1181244.jpeg",
//       "duration": "1 hr",
//       "review": "4/5",
//       "amount": "\$23",
//     },
//     {
//       "title": "Data Science",
//       "teacher": "Sneha",
//       "image": "https://images.pexels.com/photos/3861957/pexels-photo-3861957.jpeg",
//       "duration": "1 hr",
//       "review": "5/5",
//       "amount": "\$20",
//     },
//     {
//       "title": "MERN Stack",
//       "teacher": "Ankit",
//       "image": "https://images.pexels.com/photos/1181671/pexels-photo-1181671.jpeg",
//       "duration": "1 hr",
//       "review": "3/5",
//       "amount": "\$26",
//     },
//     {
//       "title": "Flutter Developer",
//       "teacher": "Rahul",
//       "image": "https://cdn.prod.website-files.com/646497e9af65ec660cdb5328/65d8c2bc53691cc47bc5064f_Cover_Flutter.webp",
//       "duration": "1 hr",
//       "review": "4/5",
//       "amount": "\$25",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         padding: const EdgeInsets.all(8),
//         children: [
//           const Text(
//             "Featured Courses",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             height: 160,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: courses.length,
//               itemBuilder: (context, index) => featuredCard(context, index),
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Main courses section (Page33)
//           SizedBox(
//             height: 555,
//             child: Page33(
//               onSaveToggle: (Map<String, String> course) {
//                 onSaveToggle(course);
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }

//   Widget featuredCard(BuildContext context, int index) {
//     final course = courses[index];

//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CourseDetailPage(
//               title: course["title"] ?? "",
//               teacher: course["teacher"] ?? "",
//               image: course["image"] ?? "",
//               duration: course["duration"] ?? "",
//               review: course["review"] ?? "",
//               amount: course["amount"] ?? "",
//             ),
//           ),
//         );
//       },
//       borderRadius: BorderRadius.circular(12),
//       splashColor: Colors.blue.withOpacity(0.2),
//       child: Container(
//         width: 180,
//         height: 200,
//         margin: const EdgeInsets.only(right: 10),
//         child: Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           elevation: 3,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Image
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                 child: Image.network(
//                   course["image"],
//                   height: 75,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     height: 75,
//                     color: Colors.grey[300],
//                     child: const Center(child: Icon(Icons.broken_image)),
//                   ),
//                 ),
//               ),
//               // Title
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   course["title"] ?? "No Title",
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               // Duration, Review, Amount
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 2.0),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.timer_outlined, size: 16),
//                     const SizedBox(width: 4),
//                     Text(course["duration"] ?? ""),
//                     const SizedBox(width: 8),
//                     const Icon(Icons.star, size: 16, color: Colors.amber),
//                     const SizedBox(width: 4),
//                     Text(course["review"] ?? ""),
//                     const SizedBox(width: 8),
//                     Container(
//                       width: 50,
//                       height: 32,
//                       decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         course["amount"] ?? "",
//                         style: const TextStyle(color: Colors.white, fontSize: 14),
//                       ),
//                     ),
//                     const Spacer(),
                    
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/featuredCourse.dart';
import 'package:flutter_application_1/page3.dart';
import 'package:flutter_application_1/video.dart';

class Page11 extends StatelessWidget {
  final Function(Map<String, String>) onSaveToggle;

  const Page11({super.key, required this.onSaveToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('courses').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No courses found"));
          }

          final courses = snapshot.data!.docs;

          return ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                "Featured Courses",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Horizontal featured list
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index].data() as Map<String, dynamic>;
                    return featuredCard(context, course);
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Instead of All Courses list → show Page3
              // const Text(
              //   "All Courses",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 10),

              // Call Page3 directly here
              SizedBox(
                height: 500, // adjust height if needed
                child: Page33(onSaveToggle: onSaveToggle),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget featuredCard(BuildContext context, Map<String, dynamic> course) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailPage(
              title: course["title"],
              teacher: course["teacher"],
              image: course["image"],
              duration: course["duration"],
              review: course["review"],
              amount: course["amount"],
            ),
          ),
        );
      },
      child: Container(
        width: 180,
        height: 200,
        margin: const EdgeInsets.only(right: 10),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  course["image"],
                  height: 75,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 75,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  course["title"] ?? "No Title",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  children: [
                    const Icon(Icons.timer_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(course["duration"] ?? ""),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(course["review"] ?? ""),
                    const SizedBox(width: 8),
                    Container(
                      width: 50,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        course["amount"] ?? "",
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const Spacer(),
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
