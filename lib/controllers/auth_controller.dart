import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();

  final isLoading = false.obs;

  final authService = AuthService();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter an Email';
    RegExp emailExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailExp.hasMatch(value) ? null : 'Please enter a valid Email';
  }

  Future<void> submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final data = {
        "username": userNameController.text.trim(),
        "email": emailController.text.trim(),
        "password": PasswordController.text,
      };
      await authService.createUser(data, context);
      isLoading.value = false;
    }
  }

  Future<void> submitLoginForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;

        final data = {
          "email": emailController.text.trim(),
          "password": PasswordController.text,
        };

        await authService.login(data, context);
      } catch (e) {
        print(" Error during login: $e");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login failed: $e")));
      } finally {
        isLoading.value = false;
      }
    } else {
      print(" Form validation failed");
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    PasswordController.dispose();
    super.onClose();
  }
}
