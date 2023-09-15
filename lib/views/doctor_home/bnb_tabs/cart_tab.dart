import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/doctor/bnb_tabs/cart_controller.dart';
import 'package:hunter/controllers/doctor/home_controller.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cC = Get.put(CartController());
    HomeController homeController = Get.find();
    return const Placeholder(
      child: Center(
        child: Text('cart'),
      ),
    );
  }
}
