// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/project3.dart';

// class Project22 extends StatefulWidget {
//   const Project22({super.key});

//   @override
//   State<Project22> createState() => _Project22State();
// }

// class _Project22State extends State<Project22> {
//   TextEditingController cont1=TextEditingController();
//     TextEditingController cont2=TextEditingController();
//   TextEditingController cont3=TextEditingController();
//   TextEditingController cont4=TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Column(
//       children: [
//                 SizedBox(height: 20,),

//         Text("Register"),
//         SizedBox(height: 20,),
//         TextField(
//           controller: cont1,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
            
//             label: Text("Name"),
//             hintText: "Enter your full name"
//           ),
          
          
//         ),
//         SizedBox(height: 13,),

//         TextField(
//           controller: cont2,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
            
//             label: Text("Email"),
//             hintText: "Enter your email id"
//           ),
          
          
//         ),        SizedBox(height: 13,),


//         TextField(
//           controller: cont3,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
            
//             label: Text("Mobile"),
//             hintText: "Enter your mobile number"
//           ),
          
          
//         ),
//         SizedBox(height: 13,),



//         TextField(
//           controller: cont4,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
            
//             label: Text("Password"),
//             hintText: "Enter your password"
//           ),
          
          
//         )
//         ,SizedBox(height: 20,)
//         ,
//         Center(
//                 child: ElevatedButton(onPressed: (
                  
//                 ){
//                   FirebaseAuth.instance.createUserWithEmailAndPassword(
//                             email:cont2.text,
//                             password: cont4.text).then((value) {
//                       print("Create a new account");
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Project22()));
//                 },
//                  ).onError((error, StackTrace) {
//                       print("Errorr----- $error");
//                     });},
//                  child: Text("Register",style: TextStyle(color: Colors.white),),
//                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue))),
                
//                 ),

//                 Row(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Not a new member?"),
//                     TextButton(onPressed: (


//                     ){

//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Project33()));
//                     }, child: Text("Login"))
//                   ],
//                 )

                
//       ],
//     ),);
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/project3.dart';

class Project22 extends StatefulWidget {
  const Project22({super.key});

  @override
  State<Project22> createState() => _Project22State();
}

class _Project22State extends State<Project22> {
  TextEditingController cont1 = TextEditingController();
  TextEditingController cont2 = TextEditingController();
  TextEditingController cont3 = TextEditingController();
  TextEditingController cont4 = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove backgroundColor here so the gradient is visible
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A73E8), // Deep blue
              Color(0xFF64B5F6), // Lighter blue
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

                // Title
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
                          prefixIcon:
                              const Icon(Icons.person, color: Colors.blueAccent),
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
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.blueAccent),
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
                          prefixIcon:
                              const Icon(Icons.phone, color: Colors.blueAccent),
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
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: cont2.text.trim(),
                                    password: cont4.text.trim(),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Account created successfully! 🎉"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.push(
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
