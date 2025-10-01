import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khmer_recipe/Screen/HomeScreen.dart';
import 'package:khmer_recipe/Screen/NotificationScreen.dart';
import 'package:khmer_recipe/Screen/ProfileScreen.dart';
import 'package:khmer_recipe/Screen/SearchScreen.dart';
import 'bottom_nav_controller.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    const Color activeColor = Color(0xFF28A07D);
    const Color inactiveColor = Colors.grey;
    final List<Widget> screens = [
      const HomeScreen(),
      const SearchScreen(),
      const Notificationscreen(),
      const Profilescreen(),
    ];

    return Obx(
      () => Scaffold(
        body: screens[controller.selectedIndex.value],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: activeColor,
          shape: const CircleBorder(),
          child: IconButton(
            onPressed: () => controller.selectTab(0),
            icon: SvgPicture.asset(
              'assets/icons/icon_scan.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => controller.selectTab(0),
                icon: SvgPicture.asset(
                  'assets/icons/icon_home.svg',
                  colorFilter: ColorFilter.mode(
                    controller.selectedIndex.value == 0
                        ? activeColor
                        : inactiveColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => controller.selectTab(1),
                icon: SvgPicture.asset(
                  'assets/icons/icon_search.svg',
                  colorFilter: ColorFilter.mode(
                    controller.selectedIndex.value == 1
                        ? activeColor
                        : inactiveColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 48),
              IconButton(
                onPressed: () => controller.selectTab(2),
                icon: SvgPicture.asset(
                  'assets/icons/icon_notification.svg',
                  colorFilter: ColorFilter.mode(
                    controller.selectedIndex.value == 2
                        ? activeColor
                        : inactiveColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => controller.selectTab(3),
                icon: SvgPicture.asset(
                  'assets/icons/icon_profile.svg',
                  colorFilter: ColorFilter.mode(
                    controller.selectedIndex.value == 3
                        ? activeColor
                        : inactiveColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
