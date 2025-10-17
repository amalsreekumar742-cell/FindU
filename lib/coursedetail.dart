// // import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';

// // class CourseDetail1 extends StatefulWidget {
// //   final String? val1; 
// //   final String? val2; 
// //   final String? val3; 

// //   const CourseDetail1({super.key, this.val1, this.val2, this.val3});

// //   @override
// //   State<CourseDetail1> createState() => _CourseDetail1State();
// // }

// // class _CourseDetail1State extends State<CourseDetail1> {
// //   late VideoPlayerController _controller;

// //   @override
// //   void initState() {
// //     super.initState();

// //     // Load video from assets
// //     _controller = VideoPlayerController.asset('asset/videos/vdeo.mp4')
// //       ..initialize().then((_) {
// //         setState(() {}); // Refresh UI once video loads
// //       });
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.val1 ?? "Course Detail"),
// //         backgroundColor: Colors.blueAccent,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
            
// //             if (widget.val2 != null)
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(12),
// //                 child: Image.network(
// //                   widget.val2!,
// //                   height: 200,
// //                   width: double.infinity,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),

// //             const SizedBox(height: 20),

            
// //             Text(
// //               widget.val1 ?? "No title available",
// //               style: const TextStyle(
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),

// //             const SizedBox(height: 10),

           
// //             Text(
// //               widget.val3 ??
// //                   "No course description provided. Please check again later.",
// //               style: const TextStyle(
// //                 fontSize: 16,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/video.dart';

// class CourseOutlinePage extends StatefulWidget {
//   const CourseOutlinePage({super.key});

//   @override
//   State<CourseOutlinePage> createState() => _CourseOutlinePageState();
// }

// class _CourseOutlinePageState extends State<CourseOutlinePage> {
//   final List<Map<String, dynamic>> courseSections = [
//     {
//       'title': '1. Camera configuration',
//       'videos': [
//         {
//           'title': 'Essentials of camera config',
//           'duration': '4m 26s',
//           'done': true,
//           'path': 'asset/video/nature.mp4',
//           'desc': 'Learn the basics of camera configuration.'
//         },
//         {
//           'title': 'Setting camera storage',
//           'duration': '7m 13s',
//           'done': false,
//           'path': 'asset/video/nature.mp4',
//           'desc': 'Understand how to manage your camera storage settings.'
//         },
//       ],
//       'expanded': true,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Course Outline")),
//       body: ListView.builder(
//         itemCount: courseSections.length,
//         itemBuilder: (context, index) {
//           final section = courseSections[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: ExpansionTile(
//               initiallyExpanded: section['expanded'],
//               title: Text(
//                 section['title'],
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               children: section['videos'].map<Widget>((video) {
//                 return ListTile(
//                   leading: Icon(
//                     video['done'] ? Icons.check_circle : Icons.radio_button_unchecked,
//                     color: video['done'] ? Colors.green : Colors.grey,
//                   ),
//                   title: Text(video['title']),
//                   trailing: Text(video['duration'],
//                       style: const TextStyle(color: Colors.grey)),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => VideoApps(
//                           val1: video['title'],
//                           val2: video['path'],
//                           val3: video['desc'],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

