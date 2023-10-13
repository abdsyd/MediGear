import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/icons.dart';
import 'package:hunter/controllers/doctor/product_controller.dart';
import 'package:hunter/models/product_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/k.dart';

class ProductView extends StatelessWidget {
  ProductView({
    Key? key,
  }) : super(key: key);

  final ProductModel product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    ProductController productController =
        Get.put(ProductController(product: product));

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GetBuilder<ProductController>(
            builder: (controller) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.6,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      itemCount: controller.product.images.length,
                      itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl:
                            "$kHostIP/${controller.product.images[index].path}",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>LoadingAnimationWidget.inkDrop(color: AppColors.myPrimary, size: 40),
                      ),
                      onPageChanged: (int index) {
                        controller.setPicIndex(index);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedSmoothIndicator(
                        activeIndex: controller.picIndex,
                        count: controller.product.images.length,
                        effect: const WormEffect(
                          dotHeight: 6,
                          dotWidth: 45,
                          activeDotColor: AppColors.myPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 26)),
                Text(
                  product.brand.title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color: Colors.grey[800],
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: AppColors.myPrimary,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: SizedBox(
                        height: 40,
                        width: 110,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                productController.decreaseQty();
                              },
                              icon: const Icon(
                                CupertinoIcons.minus,
                                size: 17,
                              ),
                              color: Colors.white,
                            ),
                            GetBuilder<ProductController>(
                                builder: (controller) {
                              return Text(
                                controller.qty.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              );
                            }),
                            IconButton(
                              onPressed: () {
                                productController.increaseQty();
                              },
                              icon: const Icon(
                                CupertinoIcons.add,
                                size: 17,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'About Product ',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 22),
                ),
                Text(
                  product.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18, color: Colors.grey[600]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(4),
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey[400],
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border))),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.myPrimary),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            MyIcon.shopping_bag,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'add to bag',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
