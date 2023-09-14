import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/icons.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/home/home_controller.dart';
import 'package:hunter/data/bottom_bar_tabs.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Stack(
            children: [
              bodies[controller.currentIndex],
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Visibility(
                  visible: controller.currentUser != null && !controller.currentUser!.isVerified,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.amber, // Customize the background color
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Verify your account to unlock premium features!".tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //-----****-----\\
                            Get.toNamed(AppRoute.registerOTP);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Customize button color
                            textStyle: const TextStyle(fontSize: 16.0),
                          ),
                          child: Text("Verify Now".tr),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(MyIcon.home), label: 'explore'),
            BottomNavigationBarItem(icon: Icon(MyIcon.search), label: 'search'),
            BottomNavigationBarItem(icon: Icon(MyIcon.shopping_bag), label: 'bag'),
            BottomNavigationBarItem(icon: Icon(MyIcon.heart_empty), label: 'wishlist'),
            BottomNavigationBarItem(icon: Icon(MyIcon.user_outline), label: 'profile'),
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
