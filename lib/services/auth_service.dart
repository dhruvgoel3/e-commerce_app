import 'package:ecommerce_task/bottom_nav.dart';
import 'package:ecommerce_task/services/doc_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService {
  var docdata = DocData();
  CreateUser(data, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: data['email']!,
            password: data['password']!,
          );
      await docdata.addUser(data);
      Get.off(BottomNavbar());
      print("User created: ${credential.user?.uid}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User created successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

  login(data, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email']!,
        password: data['password']!,
      );
      Get.off(BottomNavbar());
      await docdata.addUser(data);
      print("Login successful: ${credential.user?.uid}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login successful!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print("Unexpected login error: $e");
    }
  }
}
