import 'package:flutter/material.dart';

class Notificationscreen extends StatelessWidget {
  const Notificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Notification Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}