import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/supplier/product_controller.dart';
import 'package:hunter/models/product_model.dart';

class AddProductBottomSheet extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  AddProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Add Product'),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {},
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
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
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
                  child: TextField(
                    controller: productController.price,
                    decoration: const InputDecoration(labelText: 'Price'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: productController.quantity,
                    decoration: const InputDecoration(labelText: 'Quantity'),
                  ),
                ),
              ],
            ),
            TextField(
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
              onPressed: () {
                final product = Product(
                  title: productController.title.text,
                  price: double.parse(productController.price.text),
                  description: productController.description.text,
                  imageUrl: productController.image.text,
                  quantity: int.parse(productController.quantity.text),
                  barcode: productController.barcode.text,
                  category: productController.category.text,
                );
                productController.addProduct(product);
                Get.back();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
