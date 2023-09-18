import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/models/product_model.dart';

class ProductController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController image = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController barcode = TextEditingController();

  final RxList<Product> products = <Product>[].obs;

  void addProduct(Product product) {
    products.add(product);
  }

}