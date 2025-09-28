import 'dart:async'; // Required for the Timer
import 'package:flutter/material.dart';
import 'package:khmer_recipe/Botton_nav/BottomNavBar.dart';
// import 'package:khmer_recipe/Screen/HomeScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Start a timer that will run a function after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // This code will run after the timer is complete
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Bottomnavbar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image (reusing your existing image)
          Image.asset(
            'assets/images/welcome_image.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}