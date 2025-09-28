import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khmer_recipe/Screen/HomeScreen.dart';
import 'package:khmer_recipe/Screen/NotificationScreen.dart';
import 'package:khmer_recipe/Screen/ProfileScreen.dart';
import 'package:khmer_recipe/Screen/SearchScreen.dart'; // <-- 1. Import the SVG package

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;

  // List of the screens to be displayed
  final List<Widget> _screens = [
    const Homescreen(),
    const Searchscreen(),
    const Notificationscreen(),
    const Profilescreen(),
  ];

  // This method handles the tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define active and inactive colors
    const Color activeColor = Color(0xFF28A07D);
    const Color inactiveColor = Colors.grey;

    return Scaffold(
      // Display the selected screen from the list
      body: _screens[_selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action for the floating action button
        },
        backgroundColor: activeColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.food_bank_outlined, color: Colors.white),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Icon
            IconButton(
              onPressed: () => _onItemTapped(0),
              icon: SvgPicture.asset(
                'assets/icons/icon_home.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0 ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            // Search Icon
            IconButton(
              onPressed: () => _onItemTapped(1),
              icon: SvgPicture.asset(
                'assets/icons/icon_search.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 48), // Space for the FAB
            // Notification Icon
            IconButton(
              onPressed: () => _onItemTapped(2),
              icon: SvgPicture.asset(
                'assets/icons/icon_notification.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2 ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            // Profile Icon
            IconButton(
              onPressed: () => _onItemTapped(3),
              icon: SvgPicture.asset(
                'assets/icons/icon_profile.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3 ? activeColor : inactiveColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}