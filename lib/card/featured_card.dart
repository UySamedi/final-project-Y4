import 'package:flutter/material.dart';
import '../data/FeaturedItem.dart'; // Make sure this path is correct

class FeaturedCard extends StatelessWidget {
  // Corrected the class name from "Featureditem" to "FeaturedItem"
  final Featureditem item;

  const FeaturedCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Stack(
          // Use fit: StackFit.expand to make non-positioned children fill the stack
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              item.imageUrl,
              // BoxFit.cover ensures the image fills the entire container
              fit: BoxFit.cover,
            ),

            // Optional: Add a decorative overlay for better text readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Title
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  // Duration Info
                  Text(
                    item.duration,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
