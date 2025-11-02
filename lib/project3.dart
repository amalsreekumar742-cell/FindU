// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_app1/li.dart';
// // import 'package:flutter_app1/project2.dart';
// // import 'package:flutter_app1/shared.dart';
// import 'package:flutter_application_1/homescreen.dart';

// class Project33 extends StatefulWidget {
//   const Project33({super.key});

//   @override
//   State<Project33> createState() => _Project33State();
// }

// class _Project33State extends State<Project33> {
//   TextEditingController cont1=TextEditingController();
//     TextEditingController cont2=TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Text("Login"),
//           SizedBox(height: 13,),

//         TextField(
//           controller: cont1,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
            
//             label: Text("Email"),
//             hintText: "Enter your email id"
//           ),
          
          
//         ),

//         SizedBox(height: 13,),

//         TextField(
//           controller: cont2,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
            
//             label: Text("Password"),
//             hintText: "Enter your password"
//           ),
          
          
//         ),

//         Center(
//                 child: ElevatedButton(onPressed: (
                  
//                 ){

//                   FirebaseAuth.instance
//                         .signInWithEmailAndPassword(
//                             email: cont1.text,
//                             password: cont2.text)
//                         .then((value) {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Home11()));
//                     }).onError((error, stackTrace) {
//                       print("Error --- ${error.toString()}");
//                     });   
//                 }, child: Text("Login",style: TextStyle(color: Colors.white),),
//                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue))),
                
//                 ),
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homescreen.dart';
import 'package:flutter_application_1/project2.dart'; // For Register navigation

class Project33 extends StatefulWidget {
  const Project33({super.key});

  @override
  State<Project33> createState() => _Project33State();
}

class _Project33State extends State<Project33> {
  TextEditingController cont1 = TextEditingController();
  TextEditingController cont2 = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A73E8),
              Color(0xFF64B5F6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Title
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Login to continue your journey 🚀",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                const SizedBox(height: 40),

                // Login Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Email Field
                      TextField(
                        controller: cont1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email, color: Colors.blueAccent),
                          labelText: "Email",
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Password Field
                      TextField(
                        controller: cont2,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock, color: Colors.blueAccent),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),
                          labelText: "Password",
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async {
                            if (cont1.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please enter your email to reset password."),
                                  backgroundColor: Colors.orangeAccent,
                                ),
                              );
                              return;
                            }
                            try {
                              await FirebaseAuth.instance.sendPasswordResetEmail(
                                email: cont1.text.trim(),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Password reset link sent to your email."),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Error: ${error.toString()}"),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Login Button
                      isLoading
                          ? const CircularProgressIndicator(color: Colors.blueAccent)
                          : ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: cont1.text.trim(),
                                    password: cont2.text.trim(),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Login successful! 🎉"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Home11()),
                                  );
                                } catch (error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Error: ${error.toString()}"),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 8,
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Project22()),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
