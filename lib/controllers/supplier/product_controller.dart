import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController image = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController barcode = TextEditingController();

  GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();

  bool buttonPressed = false;

  Future pickImage(File? image) async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      image = File(returnedImage.path);
    } else {}
    update();
  }

  final RxList<Product> products = <Product>[].obs;

  void addProduct(Product product) {
    products.add(product);
  }
}
