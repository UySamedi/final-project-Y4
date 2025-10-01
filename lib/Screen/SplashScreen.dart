import 'dart:async'; // Required for the Timer
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khmer_recipe/Botton_nav/BottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      // This code will run after the timer is complete
      Get.offAll(() => const Bottomnavbar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image (reusing your existing image)
          Image.asset('assets/images/welcome_image.png', fit: BoxFit.cover),
        ],
      ),
    );
  }
}
