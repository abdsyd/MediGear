import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/bnb_tabs/explore_controller.dart';
import 'package:hunter/controllers/home_controller.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.find();
    ExploreController eC = Get.put(ExploreController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Explore'),
        actions: [
          IconButton(
            onPressed: () {
              hC.changeTab(4);
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
