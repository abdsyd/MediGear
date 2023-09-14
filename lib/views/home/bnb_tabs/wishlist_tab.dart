import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/home/bnb_tabs/wishlist_controller.dart';
import 'package:hunter/controllers/home/home_controller.dart';


class WishListTab extends StatelessWidget {
  const WishListTab({super.key});

  @override
  Widget build(BuildContext context) {
    WishListController wC = Get.put(WishListController());
    HomeController homeController = Get.find();
    return const Placeholder(
      child: Center(
        child: Text('woshlist'),
      ),
    );
  }
}
