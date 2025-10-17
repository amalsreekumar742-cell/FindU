// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/page1.dart';
// import 'package:flutter_application_1/page2.dart';
// import 'package:flutter_application_1/page3.dart';
// import 'package:flutter_application_1/page4.dart';
// import 'package:flutter_application_1/page5.dart';

// class Home11 extends StatefulWidget {
//   const Home11({super.key});

//   @override
//   State<Home11> createState() => _Home11State();
// }
// int indexnum = 0;
// List pages=[Page11(),
// page22(),
// page33(), 
// SavedPage(savedCourses: []),
// page55()

// ];

// class _Home11State extends State<Home11> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(items: 
//       const [
//         BottomNavigationBarItem(icon: Icon(Icons.home,),
//         label: "Home",
//         backgroundColor: Colors.blue
        
        
//         ),
//         BottomNavigationBarItem(icon: Icon(Icons.search),
//         label: "Search",
                
// ),
//         BottomNavigationBarItem(icon: Icon(Icons.menu_book),label: "course"),
//         BottomNavigationBarItem(icon: Icon(Icons.bookmark),label: "Saved"),
//         BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Profile"),



//       ],currentIndex: indexnum,
// iconSize: 30,
// //showSelectedLabels: false,
// //selectedFontSize: 20,
// onTap: (int index) {

// setState(() {
// indexnum = index;
// });
// },
// ),
// appBar: AppBar(title: Text("FindU"),
// ),
// body: Center(child:
// pages.elementAt(indexnum)

// ),
      
//       );
      
    
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_application_1/page1.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_application_1/page3.dart';
import 'package:flutter_application_1/page4.dart';
import 'package:flutter_application_1/page5.dart';




class Home11 extends StatefulWidget {
  const Home11({super.key});

  @override
  State<Home11> createState() => _Home11State();
}

class _Home11State extends State<Home11> {
  int indexnum = 0;

  // Central saved courses list
  List<Map<String, String>> savedCourses = [];

  @override
  Widget build(BuildContext context) {
    // List of pages for BottomNavigationBar
    final List<Widget> pages = [
      Page11(
        onSaveToggle: (course) {
          setState(() {
            if (!savedCourses.any((c) => c["title"] == course["title"])) {
              savedCourses.add(course);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${course["title"]} saved!")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${course["title"]} already saved!")),
              );
            }
          });
        },
      ),
      page22(),
      Page33(
        onSaveToggle: (course) {
          setState(() {
            if (!savedCourses.any((c) => c["title"] == course["title"])) {
              savedCourses.add(course);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${course["title"]} saved!")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${course["title"]} already saved!")),
              );
            }
          });
        },
      ),
      SavedPage(
        savedCourses: savedCourses,
        onUnsave: (course) {
          setState(() {
            savedCourses.removeWhere((c) => c["title"] == course["title"]);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${course["title"]} removed!")),
          );
        },
      ),
      page55(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("FindU"),
      ),
      body: pages[indexnum],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexnum,
        onTap: (index) => setState(() => indexnum = index),
        iconSize: 30,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: const Color.fromARGB(255, 2, 146, 241),
        unselectedItemColor: const Color.fromARGB(255, 61, 61, 61),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Course"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Profile"),
        ],
      ),
    );
  }
}

