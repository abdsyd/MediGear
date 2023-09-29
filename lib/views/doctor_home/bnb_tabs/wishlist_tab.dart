import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/doctor/bnb_tabs/wishlist_controller.dart';
import 'package:hunter/controllers/doctor/brand_product_controller.dart';
import 'package:hunter/controllers/doctor/home_controller.dart';
import 'package:hunter/widgets/product_card.dart';


class WishListTab extends StatelessWidget {
  const WishListTab({super.key});

  @override
  Widget build(BuildContext context) {
    WishListController wC = Get.put(WishListController());
    HomeController homeController = Get.find();
    BrandProductsController productsController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('WISHLIST'),
      ),
      body: GetBuilder<BrandProductsController>(builder: (controller) {
        return GridView.builder(
          itemCount: controller.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.5,
            crossAxisCount: controller.selectionIndex == 0 ? 2 : 1,
            crossAxisSpacing: 8,
            mainAxisExtent: 300,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => ProductCard(
            product: controller.products[index],
          ),
        );
      }),

    );
  }
}
