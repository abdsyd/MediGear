import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/supplier/product_controller.dart';
import 'package:hunter/models/product_model.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddProductBottomSheet extends StatelessWidget {
  const AddProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: productController.addProductFormKey,
          child: Column(
            children: [
              const Text('Add Product'),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<ProductController>(builder: (controller) {
                return productController.images.isEmpty
                    ? GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Click here to add photo',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          CarouselSlider(
                            items: productController.images.map((e) => Image.file(File(e.path))).toList(),
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              aspectRatio: 4 / 3,
                              onPageChanged: (i, reason) => controller.setPicIndex(i),
                            ),
                          ),
                          const SizedBox(height: 8),
                          AnimatedSmoothIndicator(
                            activeIndex: controller.picIndex,
                            count: controller.images.length,
                            effect: WormEffect(),
                          )
                        ],
                      );
              }),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (val) {
                        return validateInput2(productController.title.text, 4, 100, 'title');
                      },
                      onChanged: (val) {
                        if (productController.buttonPressed) {
                          productController.addProductFormKey.currentState!.validate();
                        }
                      },
                      controller: productController.title,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      //value: productController.category.text,
                      onChanged: (newValue) {},
                      items: [
                        DropdownMenuItem(
                          value: "ar",
                          child: Text(
                            "Arabic ".tr,
                          ),
                        ),
                        DropdownMenuItem(
                          value: "en",
                          child: Text(
                            "English ".tr,
                          ),
                        ),
                      ],
                      decoration: const InputDecoration(labelText: 'Category'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (val) {
                        return validateInput2(productController.price.text, 1, 1000, "price");
                      },
                      onChanged: (val) {
                        if (productController.buttonPressed) {
                          productController.addProductFormKey.currentState!.validate();
                        }
                      },
                      controller: productController.price,
                      decoration: const InputDecoration(labelText: 'Price'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      validator: (val) {
                        return validateInput2(productController.quantity.text, 1, 1000, "quantity");
                      },
                      onChanged: (val) {
                        if (productController.buttonPressed) {
                          productController.addProductFormKey.currentState!.validate();
                        }
                      },
                      controller: productController.quantity,
                      decoration: const InputDecoration(labelText: 'Quantity'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                validator: (val) {
                  return validateInput2(productController.description.text, 10, 1000, 'Description');
                },
                onChanged: (val) {
                  if (productController.buttonPressed) {
                    productController.addProductFormKey.currentState!.validate();
                  }
                },
                controller: productController.description,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: productController.barcode,
                decoration: const InputDecoration(labelText: 'Barcode'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
