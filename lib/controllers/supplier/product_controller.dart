import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  //final TextEditingController image = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController barcode = TextEditingController();

  GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();

  bool buttonPressed = false;

  int _picIndex = 0;
  int get picIndex => _picIndex;
  void setPicIndex(int i) {
    _picIndex = i;
    update();
  }

  List<XFile> images = [];

  Future pickImage() async {
    List<XFile> selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages.isNotEmpty) images.addAll(selectedImages);
    update();
  }

  final RxList<Product> products = <Product>[].obs;

  void addProduct(Product product) {
    products.add(product);
  }
}
