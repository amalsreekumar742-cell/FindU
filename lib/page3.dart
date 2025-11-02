// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/payment.dart';
// import 'package:flutter_application_1/video.dart';

// class Page33 extends StatelessWidget {
//   final Function(Map<String, String>) onSaveToggle;

//   const Page33({super.key, required this.onSaveToggle});

//   @override
//   Widget build(BuildContext context) {
//     final Map<String, List<Map<String, dynamic>>> categories = {
//       "Sales": [
//         {
//           "title": '''Become a
// Photographer''',
//           "teacher": "Anu",
//           "image": "https://images.pexels.com/photos/1264210/pexels-photo-1264210.jpeg",
//           "progress": 0.69,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//         {
//           "title": '''Digital Marketing
// Learning''',
//           "teacher": "Annmariya",
//           "image": "https://digitallearning.eletsonline.com/wp-content/uploads/2019/04/Digital-Marketing.jpg",
//           "progress": 0.27,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//         {
//           "title": "Data Science",
//           "teacher": "Ann",
//           "image": "https://www.mygreatlearning.com/blog/wp-content/uploads/2019/09/What-is-data-science-2.jpg",
//           "progress": 0.27,
//           "payment": "\$20",
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//       ],
//       "Developing": [
//         {
//           "title": "How to learn Python",
//           "teacher": "John",
//           "image": "https://cdn.bap-software.net/2024/06/20164527/where-to-find-great-python-developers.jpg",
//           "progress": 0.84,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//         {
//           "title": '''Flutter app
// development''',
//           "teacher": "Juvan",
//           "image": "https://cdn.prod.website-files.com/646497e9af65ec660cdb5328/65d8c2bc53691cc47bc5064f_Cover_Flutter.webp",
//           "progress": 0.72,
//           "payment": "\$25",
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//         {
//           "title": "Ios Developer",
//           "teacher": "Anu",
//           "image": "https://cdn.geekboots.com/geek/ios-app-meta-1670401648275.jpg",
//           "progress": 0.27,
//           "payment": "\$23",
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//         {
//           "title": "Mern Stack",
//           "teacher": "Archana",
//           "image": "https://i0.wp.com/blog.apitier.com/wp-content/uploads/2023/02/MERN_Stack.jpg?fit=560%2C315&ssl=1",
//           "progress": 0.27,
//           "payment": "\$26",
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//       ],
//       "Creative": [
//         {
//           "title": "Creative Thinking",
//           "teacher": "Jose",
//           "image": "https://thumbs.dreamstime.com/b/creative-thinking-ideas-innovation-concept-logical-idea-silhouette-man-light-bulb-his-brain-copy-space-dark-317029948.jpg",
//           "progress": 0.45,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//         {
//           "title": "Graphic Designing",
//           "teacher": "Varun",
//           "image": "https://images.stockcake.com/public/3/9/1/3913ebb1-633d-4f54-a808-b33887022e25_large/creative-digital-workspace-stockcake.jpg",
//           "progress": 0.56,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ]
//             }
//           ]
//         },
//       ],
//     };

//     final tabs = categories.keys.toList();
//     final premiumCourses = ["Ios Developer", "Mern Stack", "Data Science",'''Flutter app
// development'''];

//     return DefaultTabController(
//       length: tabs.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Courses"),
//           bottom: TabBar(tabs: tabs.map((tab) => Tab(text: tab)).toList()),
//         ),
//         body: TabBarView(
//           children: tabs.map((tab) {
//             final courses = categories[tab]!;

//             return ListView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: courses.length,
//               itemBuilder: (context, index) {
//                 final course = courses[index];
//                 final isPremium = premiumCourses.contains(course["title"]);

//                 return GestureDetector(
//                   onTap: () {
//                     if (course.containsKey("sections")) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => VideoApps(
//                             val1: course["title"],
//                             val2: course["image"],
//                             val3: course["teacher"],
//                             sections: course["sections"],
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                   child: SizedBox(
//                     height: 140, // uniform height
//                     child: Card(
//                       margin: const EdgeInsets.symmetric(vertical: 6),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                       elevation: 4,
//                       child: Stack(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(15),
//                                   bottomLeft: Radius.circular(15),
//                                 ),
//                                 child: Image.network(
//                                   course["image"],
//                                   width: 120,
//                                   height: 140,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         course["title"],
//                                         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       const SizedBox(height: 2),
//                                       Text(course["teacher"], style: const TextStyle(color: Colors.grey, fontSize: 14)),
//                                       const SizedBox(height: 6),
//                                       LinearProgressIndicator(
//                                         value: course["progress"],
//                                         minHeight: 6,
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Colors.blue,
//                                         backgroundColor: Colors.grey[300],
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text("${(course["progress"] * 100).toInt()}% complete",
//                                           style: const TextStyle(fontSize: 12, color: Colors.grey)),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // Bookmark icon
//                           Positioned(
//                             top: 5,
//                             right: 5,
//                             child: IconButton(
//                               icon: const Icon(Icons.bookmark_add_outlined),
//                               onPressed: () {
//                                 onSaveToggle({
//                                   "title": course["title"],
//                                   "teacher": course["teacher"],
//                                   "image": course["image"],
//                                 });
//                               },
//                             ),
//                           ),
//                           // Premium badge
//                           if (isPremium)
//                             Positioned(
//                               top: 8,
//                               left: 8,
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                                 decoration: BoxDecoration(color: Colors.amber[700], borderRadius: BorderRadius.circular(12)),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: const [
//                                     Icon(Icons.emoji_events, color: Colors.white, size: 14),
//                                     SizedBox(width: 4),
//                                     Text("Premium",
//                                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           // Buy button
//                           if (isPremium && course.containsKey("payment"))
//                             Positioned(
//                               bottom: 6,
//                               right: 6,
//                               child: SizedBox(
//                                 width: 90,
//                                 height: 32,
//                                 child: TextButton(
//                                   style: ButtonStyle(
//                                     backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
//                                     shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
//                                   ),
//                                   onPressed: () {
//   if (course.containsKey("payment")) {
//     int amount = int.parse(course["payment"].toString().replaceAll("\$", ""));
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Homescreen(amount: amount),
//       ),
//     );
//   }
// },

//                                   child: Center(child: Text(course["payment"], style: const TextStyle(color: Colors.white, fontSize: 14))),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/payment.dart';
// import 'package:flutter_application_1/statistics.dart';
// import 'package:flutter_application_1/video.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Page33 extends StatefulWidget {
//   final Function(Map<String, String>) onSaveToggle;
//   final bool showPremiumOnly;

//   const Page33({
//     super.key,
//     required this.onSaveToggle,
//     this.showPremiumOnly = false,
//   });

//   @override
//   State<Page33> createState() => _Page33State();
// }

// class _Page33State extends State<Page33> {
//   List<String> purchasedCourses = [];
//   List<String> savedCourses = [];
//   Map<String, double> courseProgress = {}; // 👈 added

//   @override
//   void initState() {
//     super.initState();
//     loadPurchasedCourses();
//     loadSavedCourses();
//     loadCourseProgress(); // 👈 added
//   }

//   Future<void> loadPurchasedCourses() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       purchasedCourses = prefs.getStringList('purchased_courses') ?? [];
//     });
//   }

//   Future<void> loadSavedCourses() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       savedCourses = prefs.getStringList('saved_courses') ?? [];
//     });
//   }

//   Future<void> loadCourseProgress() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey('course_progress')) {
//       final jsonString = prefs.getString('course_progress');
//       setState(() {
//         courseProgress = Map<String, double>.from(json.decode(jsonString!));
//       });
//     }
//   }

//   Future<void> toggleSavedCourse(String title) async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       if (savedCourses.contains(title)) {
//         savedCourses.remove(title);
//       } else {
//         savedCourses.add(title);
//       }
//     });
//     await prefs.setStringList('saved_courses', savedCourses);
//   }

//   Future<void> markPurchased(String title) async {
//     final prefs = await SharedPreferences.getInstance();
//     if (!purchasedCourses.contains(title)) {
//       purchasedCourses.add(title);
//       await prefs.setStringList('purchased_courses', purchasedCourses);
//       setState(() {});
//     }
//   }

//   bool isPurchased(String title) => purchasedCourses.contains(title);

//   @override
//   Widget build(BuildContext context) {
//     final Map<String, List<Map<String, dynamic>>> categories = {
//       "Sales": [
//         {
//           "title": "Become a Photographer",
//           "teacher": "Anu",
//           "image":
//               "https://images.pexels.com/photos/1264210/pexels-photo-1264210.jpeg",
//           "progress": 0.0,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"},
//               ],
//             },
//             {
//               "title": "Basics",
//               "videos": [
//                 {"title": "Basics", "duration": "1m 30s", "path": "asset/video/Nature1.mp4"}
//               ],
//             }
//           ]
//         },
//         {
//           "title": "Digital Marketing Learning",
//           "teacher": "Annmariya",
//           "image":
//               "https://digitallearning.eletsonline.com/wp-content/uploads/2019/04/Digital-Marketing.jpg",
//           "progress": 0.0,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ],
//             }
//           ]
//         },
//         {
//           "title": "Data Science",
//           "teacher": "Ann",
//           "image":
//               "https://www.mygreatlearning.com/blog/wp-content/uploads/2019/09/What-is-data-science-2.jpg",
//           "progress": 0.0,
//           "payment": "\$20",
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ],
//             }
//           ]
//         },
//       ],
//       "Developing": [
//         {
//           "title": "How to learn Python",
//           "teacher": "John",
//           "image":
//               "https://cdn.bap-software.net/2024/06/20164527/where-to-find-great-python-developers.jpg",
//           "progress": 0.0,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ],
//             }
//           ]
//         },
//         {
//           "title": "Flutter app development",
//           "teacher": "Juvan",
//           "image":
//               "https://cdn.prod.website-files.com/646497e9af65ec660cdb5328/65d8c2bc53691cc47bc5064f_Cover_Flutter.webp",
//           "progress": 0.0,
//           "payment": "\$25",
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ],
//             }
//           ]
//         },
//         {
//           "title": "Ios Developer",
//           "teacher": "Anu",
//           "image": "https://cdn.geekboots.com/geek/ios-app-meta-1670401648275.jpg",
//           "progress": 0.0,
//           "payment": "\$23",
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ],
//             }
//           ]
//         },
//         {
//           "title": "Mern Stack",
//           "teacher": "Archana",
//           "image":
//               "https://i0.wp.com/blog.apitier.com/wp-content/uploads/2023/02/MERN_Stack.jpg?fit=560%2C315&ssl=1",
//           "progress": 0.0,
//           "payment": "\$26",
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ],
//             }
//           ]
//         },
//       ],
//       "Creative": [
//         {
//           "title": "Creative Thinking",
//           "teacher": "Jose",
//           "image":
//               "https://thumbs.dreamstime.com/b/creative-thinking-ideas-innovation-concept-logical-idea-silhouette-man-light-bulb-his-brain-copy-space-dark-317029948.jpg",
//           "progress": 0.0,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ],
//             }
//           ]
//         },
//         {
//           "title": "Graphic Designing",
//           "teacher": "Varun",
//           "image":
//               "https://images.stockcake.com/public/3/9/1/3913ebb1-633d-4f54-a808-b33887022e25_large/creative-digital-workspace-stockcake.jpg",
//           "progress": 0.0,
//           "sections": [
//             {
//               "title": "Introduction",
//               "videos": [
//                 {"title": "Welcome", "duration": "1m 45s", "path": "asset/video/nature.mp4"}
//               ],
//             }
//           ]
//         },
//       ],
//     };

//     final tabs = categories.keys.toList();
//     final premiumCourses = ["Ios Developer", "Data Science", "Flutter app development", "Mern Stack"];

//     return DefaultTabController(
//       length: tabs.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Courses"),
//           automaticallyImplyLeading: false,

//           actions: [
//             IconButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>StatisticsPage()));
//           }, icon: Icon(Icons.stairs_outlined)),
//           ],
          
           
//           bottom: TabBar(tabs: tabs.map((tab) => Tab(text: tab)).toList()),
//         ),
//         body: TabBarView(
//           children: tabs.map((tab) {
//             return _buildCourseList({tab: categories[tab]!}, premiumCourses);
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildCourseList(Map<String, List<Map<String, dynamic>>> courseData,
//       List<String> premiumCourses) {
//     final courses = courseData.values.expand((e) => e).toList();

//     return ListView.builder(
//       padding: const EdgeInsets.all(12),
//       itemCount: courses.length,
//       itemBuilder: (context, index) {
//         final course = courses[index];
//         final isPremium = premiumCourses.contains(course["title"]);
//         final purchased = isPurchased(course["title"]);
//         final isSaved = savedCourses.contains(course["title"]);

//         final progressValue = courseProgress[course["title"]] ?? course["progress"];

//         return SizedBox(
//           height: 160,
//           child: Card(
//             margin: const EdgeInsets.symmetric(vertical: 6),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             elevation: 4,
//             child: InkWell(
//               borderRadius: BorderRadius.circular(15),
//               onTap: () async {
//                 if (isPremium && !purchased && course.containsKey("payment")) {
//                   int amount = int.parse(course["payment"].toString().replaceAll("\$", ""));
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PaymentPage(
//                         amount: amount,
//                         onPaymentSuccess: () async {
//                           await markPurchased(course["title"]);
//                           // Navigator.pushReplacement(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => VideoApps(
//                           //       val1: course["title"],
//                           //       val2: course["image"],
//                           //       val3: course["teacher"],
//                           //       // sections:
//                           //       //     List<Map<String, dynamic>>.from(course["sections"] ?? []),
//                           //     ),
//                           //   ),
//                           // );
//                         },
//                       ),
//                     ),
//                   );
//                 } else {
//                   final updatedProgress = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => VideoApps(
//                         val1: course["title"],
//                         val2: course["image"],
//                         val3: course["teacher"],
//                         sections:
//                             List<Map<String, dynamic>>.from(course["sections"] ?? []),
//                       ),
//                     ),
//                   );

//                   if (updatedProgress != null) {
//                     setState(() {
//                       courseProgress[course["title"]] = updatedProgress;
//                     });
//                   }
//                 }
//               },
//               child: Stack(
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           bottomLeft: Radius.circular(15),
//                         ),
//                         child: Image.network(
//                           course["image"],
//                           width: 120,
//                           height: 160,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 course["title"],
//                                 style: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               Text(course["teacher"],
//                                   style: const TextStyle(
//                                       color: Colors.grey, fontSize: 14)),
//                               const SizedBox(height: 6),
//                               LinearProgressIndicator(
//                                 value: progressValue,
//                                 minHeight: 6,
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.blue,
//                                 backgroundColor: Colors.grey[300],
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                   "${(progressValue * 100).toInt()}% complete",
//                                   style: const TextStyle(
//                                       fontSize: 12, color: Colors.grey)),
//                               const Spacer(),
//                               Expanded(
//                                 child: Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Transform.translate(
//                                     offset: const Offset(0, -14),
//                                     child: IconButton(
//                                       icon: Icon(
//                                         isSaved
//                                             ? Icons.bookmark
//                                             : Icons.bookmark_border,
//                                         color: isSaved
//                                             ? Colors.amber
//                                             : Colors.grey,
//                                       ),
//                                       onPressed: () {
//                                         toggleSavedCourse(course["title"]);
//                                         widget.onSaveToggle({
//                                           "title": course["title"],
//                                           "image": course["image"],
//                                           "teacher": course["teacher"],
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   if (isPremium)
//                     Positioned(
//                       top: 8,
//                       left: 8,
//                       child: Container(
//                         padding:
//                             const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.amber[800],
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.star, size: 14, color: Colors.white),
//                             SizedBox(width: 4),
//                             Text(
//                               "Premium",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 12),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   if (isPremium && !purchased && course.containsKey("payment"))
//                     Positioned(
//                       bottom: 8,
//                       right: 48,
//                       child: Container(
//                         width: 90,
//                         height: 32,
//                         decoration: BoxDecoration(
//                           color: Colors.blueAccent,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(
//                           course["payment"],
//                           style:
//                               const TextStyle(color: Colors.white, fontSize: 14),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }




import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/payment.dart';
import 'package:flutter_application_1/statistics.dart';
import 'package:flutter_application_1/video.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page33 extends StatefulWidget {
  final Function(Map<String, String>) onSaveToggle;
  final bool showPremiumOnly;

  const Page33({
    super.key,
    required this.onSaveToggle,
    this.showPremiumOnly = false,
  });

  @override
  State<Page33> createState() => _Page33State();
}

class _Page33State extends State<Page33> {
  List<String> purchasedCourses = [];
  List<String> savedCourses = [];
  Map<String, double> courseProgress = {};
  final List<String> tabs = ["Sales", "Developing", "Creative"];
  Map<String, List<Map<String, dynamic>>> allCourses = {};
  bool isLoading = true;
  String error = "";

  @override
  void initState() {
    super.initState();
    loadPurchasedCourses();
    loadSavedCourses();
    loadCourseProgress();
    fetchCourses();
  }

  
  Future<void> loadPurchasedCourses() async {
    final prefs = await SharedPreferences.getInstance();
    purchasedCourses = prefs.getStringList('purchased_courses') ?? [];
  }

  Future<void> loadSavedCourses() async {
    final prefs = await SharedPreferences.getInstance();
    savedCourses = prefs.getStringList('saved_courses') ?? [];
  }

  Future<void> loadCourseProgress() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('course_progress')) {
      final jsonString = prefs.getString('course_progress');
      courseProgress = Map<String, double>.from(json.decode(jsonString!));
    }
  }

  Future<void> toggleSavedCourse(String title) async {
    final prefs = await SharedPreferences.getInstance();
    if (savedCourses.contains(title)) {
      savedCourses.remove(title);
    } else {
      savedCourses.add(title);
    }
    await prefs.setStringList('saved_courses', savedCourses);
    setState(() {});
  }

  Future<void> markPurchased(String title) async {
    final prefs = await SharedPreferences.getInstance();
    if (!purchasedCourses.contains(title)) {
      purchasedCourses.add(title);
      await prefs.setStringList('purchased_courses', purchasedCourses);
      setState(() {});
    }
  }

  bool isPurchased(String title) => purchasedCourses.contains(title);

  // 🟦 Fetch dynamic data from Firestore (like CoursesPage)
  Future<void> fetchCourses() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      Map<String, List<Map<String, dynamic>>> fetched = {};

      QuerySnapshot categorySnapshot =
          await firestore.collection('categories').get();

      for (var categoryDoc in categorySnapshot.docs) {
        String categoryName = categoryDoc.id;
        List<Map<String, dynamic>> courseList = [];

        QuerySnapshot courseSnapshot = await firestore
            .collection('categories')
            .doc(categoryName)
            .collection('courses')
            .get();

        for (var courseDoc in courseSnapshot.docs) {
          Map<String, dynamic> courseData =
              courseDoc.data() as Map<String, dynamic>;
          courseData['id'] = courseDoc.id;

          QuerySnapshot sectionSnapshot = await firestore
              .collection('categories')
              .doc(categoryName)
              .collection('courses')
              .doc(courseDoc.id)
              .collection('sections')
              .get();

          List<Map<String, dynamic>> sections = [];
          for (var sectionDoc in sectionSnapshot.docs) {
            Map<String, dynamic> sectionData =
                sectionDoc.data() as Map<String, dynamic>;
            sectionData['id'] = sectionDoc.id;

            QuerySnapshot videoSnapshot = await firestore
                .collection('categories')
                .doc(categoryName)
                .collection('courses')
                .doc(courseDoc.id)
                .collection('sections')
                .doc(sectionDoc.id)
                .collection('videos')
                .get();

            sectionData['videos'] =
                videoSnapshot.docs.map((v) => v.data() as Map<String, dynamic>).toList();
            sections.add(sectionData);
          }

          sections.sort((a, b) {
            if (a['title'] == 'Introduction') return -1;
            if (b['title'] == 'Introduction') return 1;
            return 0;
          });

          courseData['sections'] = sections;
          courseList.add(courseData);
        }

        fetched[categoryName] = courseList;
      }

      setState(() {
        allCourses = fetched;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = "Error fetching courses: $e";
        isLoading = false;
      });
    }
  }

  // 🟨 UI
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (error.isNotEmpty) {
      return Scaffold(body: Center(child: Text(error)));
    }

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Courses"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticsPage()),
              ),
              icon: const Icon(Icons.stairs_outlined),
            ),
          ],
          bottom: TabBar(
            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((tab) {
            final categoryCourses = allCourses[tab] ?? [];
            return _buildCourseList(categoryCourses);
          }).toList(),
        ),
      ),
    );
  }

  // 🟪 Build each course card
  Widget _buildCourseList(List<Map<String, dynamic>> courses) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        final isPremium = course['premium'] == true;
        final purchased = isPurchased(course['title']);
        final isSaved = savedCourses.contains(course['title']);
        final progressValue = courseProgress[course['title']] ??
    (course['progress'] is String
        ? double.tryParse(course['progress']) ?? 0.0
        : (course['progress'] ?? 0.0));


        return SizedBox(
          height: 179,
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () async {
                if (isPremium && !purchased && course.containsKey("payment")) {
                  int amount = int.parse(
                      course["payment"].toString().replaceAll(RegExp(r'[^\d]'), ""));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        amount: amount,
                        onPaymentSuccess: () async {
                          await markPurchased(course["title"]);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text("${course['title']} purchased successfully!"),
                          ));
                        },
                      ),
                    ),
                  );
                } else {
                  final updatedProgress = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoApps(
                        val1: course["title"],
                        val2: course["image"],
                        val3: course["teacher"],
                        sections: List<Map<String, dynamic>>.from(
                            course["sections"] ?? []),
                      ),
                    ),
                  );

                  if (updatedProgress != null) {
                    setState(() {
                      courseProgress[course["title"]] = updatedProgress;
                    });
                  }
                }
              },
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        child: Image.network(
                          course["image"] ?? "",
                          width: 120,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(course["title"] ?? "",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(course["teacher"] ?? "",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                              const SizedBox(height: 6),
                              LinearProgressIndicator(
                                value: progressValue,
                                minHeight: 6,
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                                backgroundColor: Colors.grey[300],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${(progressValue * 100).toInt()}% complete",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  icon: Icon(
                                    isSaved
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    color:
                                        isSaved ? Colors.amber : Colors.grey,
                                  ),
                                  onPressed: () {
                                    toggleSavedCourse(course["title"]);
                                    widget.onSaveToggle({
                                      "title": course["title"],
                                      "image": course["image"],
                                      "teacher": course["teacher"],
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isPremium)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber[800],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, size: 14, color: Colors.white),
                            SizedBox(width: 4),
                            Text("Premium",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  if (isPremium && !purchased && course.containsKey("payment"))
                    Positioned(
                      bottom: 8,
                      right: 48,
                      child: Container(
                        width: 90,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(course["payment"].toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

