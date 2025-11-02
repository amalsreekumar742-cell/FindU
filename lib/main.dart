// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/firebase_options.dart';
// import 'package:flutter_application_1/homescreen.dart';
// import 'package:supabase_flutter/supabase_flutter.dart'; // 👈 Add this

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // ✅ Initialize Firebase
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   // ✅ Initialize Supabase
//   await Supabase.initialize(
//     url: 'hzzfffrtrciqumvyzcde', 
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6emZmZnJ0cmNpcXVtdnl6Y2RlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA5Mzk5MzEsImV4cCI6MjA3NjUxNTkzMX0.qdlR2LyD7ukHjE8WNUkF8d_gqtmHe0tRmvHtdfXn0pE', // 👈 Replace this
//   );

//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const Home11(), // 👈 Your first screen
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/chatscreen.dart';
import 'package:flutter_application_1/fire1.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/page1.dart';
import 'package:flutter_application_1/page3.dart';
import 'package:flutter_application_1/project1.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
     url: 'https://hzzfffrtrciqumvyzcde.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6emZmZnJ0cmNpcXVtdnl6Y2RlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA5Mzk5MzEsImV4cCI6MjA3NjUxNTkzMX0.qdlR2LyD7ukHjE8WNUkF8d_gqtmHe0tRmvHtdfXn0pE', 
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Project11()
    );
  }
}

