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
import 'package:flutter_application_1/certificate.dart';
import 'package:flutter_application_1/chatscreen.dart';
import 'package:flutter_application_1/logout.dart';
import 'package:flutter_application_1/page1.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_application_1/page3.dart';
import 'package:flutter_application_1/page4.dart' hide Page11;
import 'package:flutter_application_1/page5.dart';
import 'package:shared_preferences/shared_preferences.dart';




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

      Page22(),
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
ProfilePage()
      ,
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
      ), drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              accountName: Text("AMAL"),
              accountEmail: Text("amal1231@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                backgroundImage: NetworkImage(
                  "https://m.media-amazon.com/images/I/81mp7SHZ11L._UF1000,1000_QL80_.jpg",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blueAccent),
              title: const Text("Home"),
              onTap: () {
               Navigator.pop(context); // close drawer
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => Home11()),
);

              },
            ),
            ListTile(
              leading: const Icon(Icons.search, color: Colors.blueAccent),
              title: const Text("Search"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page22()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book, color: Colors.blueAccent),
              title: const Text("Courses"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page33(
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
        )
        ),
                );
              },
            ),
            ListTile(
  leading: const Icon(Icons.search, color: Colors.blueAccent),
  title: const Text("Certificates"),
  onTap: () async {
    Navigator.pop(context);

    // Load last completed course from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    String? completedCourse = prefs.getString('lastCompletedCourse');

    if (completedCourse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No certificate available yet. Complete a course first!"),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CertificatePage(courseTitle: completedCourse),
      ),
    );
  },
),

            ListTile(
              leading: const Icon(Icons.bookmark, color: Colors.blueAccent),
              title: const Text("Saved"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SavedPage(
        savedCourses: savedCourses,
        onUnsave: (course) {
          setState(() {
            savedCourses.removeWhere((c) => c["title"] == course["title"]);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${course["title"]} removed!")),
          );
        },
      ),),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_mark_outlined, color: Colors.blueAccent),
              title: const Text("FAQs & support"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
            
            
            
           ListTile(
  leading: const Icon(Icons.logout, color: Colors.blueAccent),
  title: const Text("Logout"),
  onTap: () {
    Navigator.pop(context); // Close drawer
    showLogoutDialog(context);
  },
),

          ],
        ),
      ),
    );
  }
}

