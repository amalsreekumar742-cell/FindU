import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/project3.dart'; // your login page

class Project22 extends StatefulWidget {
  const Project22({super.key});

  @override
  State<Project22> createState() => _Project22State();
}

class _Project22State extends State<Project22> {
  TextEditingController cont1 = TextEditingController(); // name
  TextEditingController cont2 = TextEditingController(); // email
  TextEditingController cont3 = TextEditingController(); // mobile
  TextEditingController cont4 = TextEditingController(); // password

  bool isLoading = false;

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
                const SizedBox(height: 20),
                const Text(
                  "Create Your Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Join us to find your passion ✨",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 40),

                // White card-style container
                Container(
                  width: double.infinity,
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
                      // Name Field
                      TextField(
                        controller: cont1,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person,
                              color: Colors.blueAccent),
                          labelText: "Name",
                          hintText: "Enter your full name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Email Field
                      TextField(
                        controller: cont2,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email,
                              color: Colors.blueAccent),
                          labelText: "Email",
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Mobile Field
                      TextField(
                        controller: cont3,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone,
                              color: Colors.blueAccent),
                          labelText: "Mobile",
                          hintText: "Enter your mobile number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Password Field
                      TextField(
                        controller: cont4,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.blueAccent),
                          labelText: "Password",
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Register Button
                      isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.blueAccent,
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (cont1.text.isEmpty ||
                                    cont2.text.isEmpty ||
                                    cont3.text.isEmpty ||
                                    cont4.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Please fill all the fields ❗"),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                  return;
                                }

                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  // Create user in Firebase Authentication
                                  UserCredential userCredential =
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                    email: cont2.text.trim(),
                                    password: cont4.text.trim(),
                                  );

                                  User? user = userCredential.user;

                                  // Save user data to Firestore
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(user!.uid)
                                      .set({
                                    'name': cont1.text.trim(),
                                    'email': cont2.text.trim(),
                                    'mobile': cont3.text.trim(),
                                    'uid': user.uid,
                                    'createdAt': DateTime.now(),
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Account created successfully! 🎉"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Project33()),
                                  );
                                } catch (error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("Error: ${error.toString()}"),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 8,
                              ),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Login Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a member?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Project33()),
                        );
                      },
                      child: const Text(
                        "Login",
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
