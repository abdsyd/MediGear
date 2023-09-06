import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/icons.dart';
import 'package:hunter/controllers/home_controller.dart';
import 'package:hunter/data/bottom_bar_tabs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());



    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        extendBody: true,
        body: bodies[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(MyIcon.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(MyIcon.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(MyIcon.shopping_bag), label: 'bag'),
            BottomNavigationBarItem(
                icon: Icon(MyIcon.heart_empty), label: 'wishlist'),
            BottomNavigationBarItem(
                icon: Icon(MyIcon.user_outline), label: 'profile'),
          ],
          iconSize: 20,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.myPrimary,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 10,
          currentIndex: controller.currentIndex,
          onTap: (index) {
            controller.changeTab(index);
          },
        ),
      ),
    );
  }
}
