import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/doctor/brand_product_controller.dart';
import 'package:hunter/models/product_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductCard extends GetView<BrandProductsController> {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoute.product,arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                 CachedNetworkImage(
                    imageUrl: "$kHostIP/${product.images[0].path}",
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                   placeholder: (context, url) =>LoadingAnimationWidget.inkDrop(color: AppColors.myPrimary, size: 40),
                  ),
                  GetBuilder<BrandProductsController>(builder: (controller) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: controller.iconButtonPressed
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                  size: 14,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                  size: 14,
                                ),
                        ),
                      ),
                    );
                  }),
                  Visibility(
                    visible: true,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: const EdgeInsets.all(5.5),
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4))
                        ),
                        child: const Text('NEW',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('5.0'),
                    ],
                  ),
                  Text(
                    product.title,
                    style: const TextStyle(
                          fontSize: 21,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${product.price}  USD',
                    style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
