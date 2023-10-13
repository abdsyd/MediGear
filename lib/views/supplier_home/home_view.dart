import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/icons.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/doctor/home_controller.dart';
import 'package:hunter/data/supplier_bottom_bar_tabs.dart';

class SupplierHomeView extends StatelessWidget {
  const SupplierHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        extendBody: true,
        body: SafeArea(
          child: Stack(
            children: [
              supplierBodies[controller.currentIndex],
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
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //todo : fix go otp
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
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'products'),
            BottomNavigationBarItem(icon: Icon(Icons.checklist_outlined), label: 'orders'),
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
