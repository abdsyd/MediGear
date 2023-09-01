import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/bottom_navigation_bar_controller.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController barController = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              barController.changeTab(4);
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
