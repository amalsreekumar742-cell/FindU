import 'package:flutter/material.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_application_1/page4.dart';

class page55 extends StatefulWidget {
  const page55({super.key});

  @override
  State<page55> createState() => _page55State();
}

class _page55State extends State<page55> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.green, // keeps green color
      ),
      body: const Center(
        child: Text(
          "Profile",
          style: TextStyle(fontSize: 17),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text("AMAL"),
              accountEmail: Text("amal1231@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: NetworkImage(
                  "https://m.media-amazon.com/images/I/81mp7SHZ11L._UF1000,1000_QL80_.jpg",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.timer_sharp, color: Colors.orange),
              title: const Text("Courses"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page22()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.orange),
              title: const Text("Saved Addresses"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page22()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_rounded, color: Colors.orange),
              title: const Text("Saved king Deals"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page22()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label, color: Colors.orange),
              title: const Text("Bk Wall"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page22()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_mark_outlined, color: Colors.orange),
              title: const Text("FAQs & support"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page22()),
                );
              },
            ),
            
            
            
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.orange),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page22()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
