import 'package:flutter/material.dart';

class Featureditem {
  final String title;
  final String duration;
  final String imageUrl;
  final Color backgroundColor;

  Featureditem({
    required this.title, // Changed semicolon to comma
    required this.duration, // Changed semicolon to comma
    required this.imageUrl, // Changed semicolon to comma
    required this.backgroundColor, // Changed semicolon to comma
  }); // Added a semicolon at the end of the constructor
}
