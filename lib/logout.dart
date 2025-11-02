import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/project3.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Close dialog
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.signOut();
              // Navigate to login/welcome screen and remove all previous routes
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const Project33()),
                (Route<dynamic> route) => false,
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Error logging out: $e")),
              );
            }
          },
          child: const Text(
            "Logout",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
