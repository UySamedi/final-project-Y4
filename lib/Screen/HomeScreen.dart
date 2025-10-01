// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/FeaturedItem.dart';
import '../data/PopularRecipe .dart';
import '../components/section_header.dart';
import '../card/featured_card.dart';
import '../card/PopularRecipeCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // --- Data ---
  final List<Featureditem> featuredItems = [
    Featureditem(
      title: 'Asian white noodle with extra seafood',
      duration: '20 Min',
      imageUrl: 'assets/items/item1.jpg', // Make sure you have this asset
      backgroundColor: Color(0xFF86C5BE),
    ),
    Featureditem(
      title: 'Healthy salad with fresh fruit',
      duration: '10 Min',
      imageUrl: 'assets/items/item2.jpg', // Make sure you have this asset
      backgroundColor: Color(0xFF8DC6A4),
    ),
  ];

  final List<Popularrecipe> popularRecipes = [
    Popularrecipe(
      imageUrl: 'assets/items/img_food1.jpg', // Make sure you have this asset
      title: 'Healthy Taco Salad with fresh',
      calories: '120 Kcal',
      time: '20 Min',
    ),
    Popularrecipe(
      imageUrl: 'assets/items/img_food2.webp', // Make sure you have this asset
      title: 'Japanese-style Pancakes Recipe',
      calories: '64 Kcal',
      time: '12 Min',
    ),
    Popularrecipe(
      imageUrl: 'assets/items/img_food2.webp', // Make sure you have this asset
      title: 'Japanese-style Pancakes Recipe',
      calories: '64 Kcal',
      time: '12 Min',
    ),
    Popularrecipe(
      imageUrl: 'assets/items/img_food2.webp', // Make sure you have this asset
      title: 'Japanese-style Pancakes Recipe',
      calories: '64 Kcal',
      time: '12 Min',
    ),
    Popularrecipe(
      imageUrl: 'assets/items/img_food2.webp', // Make sure you have this asset
      title: 'Japanese-style Pancakes Recipe',
      calories: '64 Kcal',
      time: '12 Min',
    ),
  ];

  int _selectedCategoryIndex = 0;
  final List<String> _categories = ['Breakfast', 'Lunch', 'Dinner', 'Dessert'];

  // --- Helper Methods for UI ---
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  IconData _getGreetingIcon() {
    final hour = DateTime.now().hour;
    if (hour < 17) return Icons.wb_sunny_outlined;
    return Icons.nightlight_round_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getGreetingIcon(), color: Colors.grey.shade600, size: 20),
                const SizedBox(width: 8),
                Text(
                  _getGreeting(),
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Uy Samedi', // Personalized name
              style: TextStyle(
                color: Color(0xFF0D1F3C),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SectionHeader(title: "Featured"),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: featuredItems.length,
              itemBuilder: (context, index) {
                return FeaturedCard(item: featuredItems[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 16),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: "Category"),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return ChoiceChip(
                  label: Text(_categories[index]),
                  selected: _selectedCategoryIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) _selectedCategoryIndex = index;
                    });
                  },
                  selectedColor: Colors.teal[300],
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: _selectedCategoryIndex == index
                        ? Colors.white
                        : Colors.black,
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.grey[300]!),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: "Popular Recipes"),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 600, // Adjust height as needed
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8, // Adjust for card shape
              ),
              itemCount: popularRecipes.length,
              itemBuilder: (context, index) {
                return PopularRecipeCard(recipe: popularRecipes[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
