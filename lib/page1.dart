// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/payment.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_application_1/page4.dart';
// class Page11 extends StatefulWidget {
//   final List<int> savedPosts;
//   final Function(int) onSaveToggle;

//   const Page11({super.key,required this.savedPosts,
//     required this.onSaveToggle,});

//   @override
//   State<Page11> createState() => _Page11State();
// }

// class _Page11State extends State<Page11> {
//   List<Map<String, String>> savedCourses = [];

  
//   List img11 = [
//     "https://www.mygreatlearning.com/blog/wp-content/uploads/2019/09/What-is-data-science-2.jpg",
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn-F-EgP1CkLQE25J9bGAHyBjhrEGqR2AWag&s",
//     "https://digitallearning.eletsonline.com/wp-content/uploads/2019/04/Digital-Marketing.jpg",
//   ];

//   List data1 = ["Data Science", "Power Bi", "Digital Marketing"];
//   List tech1 = ["mam1", "mam2", "mam3"];

//   List img12 = [
//     "https://cdn.geekboots.com/geek/ios-app-meta-1670401648275.jpg",
//     "https://i0.wp.com/blog.apitier.com/wp-content/uploads/2023/02/MERN_Stack.jpg?fit=560%2C315&ssl=1",
//     "https://cdn.bap-software.net/2024/06/20164527/where-to-find-great-python-developers.jpg",
//     "https://cdn.prod.website-files.com/646497e9af65ec660cdb5328/65d8c2bc53691cc47bc5064f_Cover_Flutter.webp"
//   ];

//   List data2 = ["Ios Developer", "Mern Stack", "Python Developer", "Flutter Developer"];
//   List tech2 = ["mam1", "mam2", "mam3", "mam4"];

//   List img13 = [
//     "https://images.pexels.com/photos/1264210/pexels-photo-1264210.jpeg?cs=srgb&dl=pexels-andre-furtado-43594-1264210.jpg&fm=jpg",
//     "https://media.istockphoto.com/id/2165367416/vector/creative-brain.jpg?s=612x612&w=0&k=20&c=soqLDoersjXGvCKUkPF5RcNDvjFyOiBieHbAtdO_qlI=",
//     "https://images.stockcake.com/public/3/9/1/3913ebb1-633d-4f54-a808-b33887022e25_large/creative-digital-workspace-stockcake.jpg",
//   ];

//   List data3 = ["Become a Photographer", "Creative Thinking", "Graphic designing"];
//   List tech3 = ["mam1", "mam2", "mam3"];

//   List<String> img1 = [
//     "https://cdn.geekboots.com/geek/ios-app-meta-1670401648275.jpg",
//     "https://www.mygreatlearning.com/blog/wp-content/uploads/2019/09/What-is-data-science-2.jpg",
//     "https://i0.wp.com/blog.apitier.com/wp-content/uploads/2023/02/MERN_Stack.jpg?fit=560%2C315&ssl=1"
//   ];

//   List<String> data = ["iOS Developer", "Data Science", "MERN Stack"];
//   List<String> dura = ["1 hr", "1.2 hr", "1.1 hr"];
//   List<String> reviews = ["4/5", "4.5/5", "3.5/5"];

//   @override
//   void initState() {
//     super.initState();
//     loadCourses();
//   }

//   Future<void> saveCourses() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = jsonEncode(savedCourses);
//     await prefs.setString('saved_courses', data);
//   }

//   Future<void> loadCourses() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString('saved_courses');
//     if (data != null) {
//       setState(() {
//         savedCourses = List<Map<String, String>>.from(jsonDecode(data));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Courses"),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.bookmark),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SavedPage(savedCourses: savedCourses),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Featured Courses",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),

//               /// Featured Horizontal List
//               SizedBox(
//                 height: 160,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: img1.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return featuredCard(index);
//                   },
//                 ),
//               ),

//               const SizedBox(height: 20),

//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   "Categories",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),

//               const TabBar(
//                 tabs: [
//                   Tab(icon: Icon(Icons.analytics_outlined), text: "Sales"),
//                   Tab(icon: Icon(Icons.people), text: "Developing"),
//                   Tab(icon: Icon(Icons.bubble_chart), text: "Creative"),
//                 ],
//               ),

//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     buildCourseList(img11, data1, tech1),
//                     buildCourseList(img12, data2, tech2),
//                     buildCourseList(img13, data3, tech3, showBuyButton: true),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// 🔹 Featured horizontal card
//   Widget featuredCard(int index) {
//     return Container(
//       width: 180,
//       margin: const EdgeInsets.only(right: 10),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Image.network(img1[index],
//                   height: 85, width: double.infinity, fit: BoxFit.cover),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(data[index],
//                   style: const TextStyle(fontWeight: FontWeight.bold)),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 children: [
//                   const Icon(Icons.timer_outlined,
//                       color: Colors.grey, size: 16),
//                   const SizedBox(width: 4),
//                   Text(dura[index], style: const TextStyle(fontSize: 12)),
//                   const SizedBox(width: 10),
//                   const Icon(Icons.star, color: Colors.amber, size: 16),
//                   Text(reviews[index], style: const TextStyle(fontSize: 12)),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   /// 🔹 Course list for each Tab
//   Widget buildCourseList(List img, List data, List tech,
//       {bool showBuyButton = false}) {
//     return ListView.builder(
//       itemCount: img.length,
//       itemBuilder: (context, index) {
//         return Card(
//           elevation: 3,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           margin: const EdgeInsets.symmetric(vertical: 10),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     bottomLeft: Radius.circular(15)),
//                 child: Image.network(
//                   img[index],
//                   height: 120,
//                   width: 120,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(data[index],
//                           style: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 5),
//                       Text(tech[index],
//                           style: TextStyle(
//                               color: Colors.grey[700], fontSize: 14)),
//                       const SizedBox(height: 10),

//                       // ✅ Show Buy button for Creative Thinking
//                       if (showBuyButton && data[index] == "Creative Thinking")
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blueAccent,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           child: const Text("Buy Now"),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: IconButton(
//     icon: const Icon(Icons.bookmark),
//     onPressed: () async {
//       // ✅ Explicitly define as Map<String, String>
//       final Map<String, String> course = {
//         "title": data[index].toString(),
//         "teacher": tech[index].toString(),
//         "image": img[index].toString(),
//       };

//       // ✅ Check for duplicates
//       if (!savedCourses.any((c) => c["title"] == course["title"])) {
//         setState(() => savedCourses.add(course));
//         await saveCourses();

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("${data[index]} saved!")),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("${data[index]} already saved!")),
//         );
//       }
//     },
//   ),
// ),

//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page3.dart';

class Page11 extends StatelessWidget {
  final Function(Map<String, String>) onSaveToggle;

  Page11({super.key, required this.onSaveToggle});

  // Featured courses
  final List<String> imgFeatured = [
    "https://cdn.geekboots.com/geek/ios-app-meta-1670401648275.jpg",
    "https://www.mygreatlearning.com/blog/wp-content/uploads/2019/09/What-is-data-science-2.jpg",
    "https://i0.wp.com/blog.apitier.com/wp-content/uploads/2023/02/MERN_Stack.jpg?fit=560%2C315&ssl=1"
  ];
  final List<String> dataFeatured = ["iOS Developer", "Data Science", "MERN Stack"];
  final List<String> dura = ["1 hr", "1.2 hr", "1.1 hr"];
  final List<String> reviews = ["4/5", "4.5/5", "3.5/5"];

  // Sales Courses
  
  
  // Creative Courses
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Courses")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Text("Featured Courses", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imgFeatured.length,
              itemBuilder: (context, index) => featuredCard(index),
            ),
          ),
          const SizedBox(height: 20),
          
          
          SizedBox(
            height: 400, // Adjust height as needed
            child:  Page33(onSaveToggle: (Map<String, String> p1) {  },), // Embed full page33 here
          ),
          const SizedBox(height: 20),
         
        ],
      ),
    );
  }

  Widget featuredCard(int index) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(imgFeatured[index], height: 85, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(dataFeatured[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Row(
              children: [
                const Icon(Icons.timer_outlined, size: 16),
                const SizedBox(width: 4),
                Text(dura[index]),
                const SizedBox(width: 8),
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text(reviews[index]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCourseList(List<String> img, List<String> data, List<String> tech, {bool showBuyButton = false}) {
    return Column(
      children: List.generate(img.length, (index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                child: Image.network(img[index], width: 120, height: 120, fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(tech[index], style: const TextStyle(color: Colors.grey, fontSize: 14)),
                      if (showBuyButton && data[index] == "Creative Thinking")
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text("Buy Now"),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.bookmark),
                  onPressed: () {
                    final course = {"title": data[index], "teacher": tech[index], "image": img[index]};
                    onSaveToggle(course);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
