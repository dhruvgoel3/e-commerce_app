import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottom_nav.dart';
import '../controllers/auth_controller.dart';
import 'doc_service.dart';

class AuthService {
  final docData = DocData();

  Future<void> createUser(
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: data['email'],
            password: Get.find<AuthController>().PasswordController.text,
          );
      await docData.addUser(data);
      print("User created: ${credential.user?.uid}");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavbar()));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User created successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print("Signup error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Signup failed: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  login(data, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email']!,
        password: data['password']!,
      );

      await FirebaseAuth.instance.authStateChanges().first;

      await docData.addUser(data);

      print("✅ Login successful: ${credential.user?.uid}");

      Future.delayed(Duration.zero, () {
        Get.off(() => BottomNavbar());
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login successful!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print("Unexpected login error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed: $e")));
    }
  }
}
