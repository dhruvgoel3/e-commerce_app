import 'package:ecommerce_task/Auth/sign_up_screen.dart';
import 'package:ecommerce_task/bottom_nav.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BottomNavbar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.blue,
                size: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
