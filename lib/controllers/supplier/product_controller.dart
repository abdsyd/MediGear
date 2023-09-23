import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {

  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController upc = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController width = TextEditingController();
  final TextEditingController length = TextEditingController();
  final TextEditingController sellQty = TextEditingController();
  final TextEditingController maxPurchaseQty = TextEditingController();
  final TextEditingController minPurchaseQty = TextEditingController();

  GlobalKey<FormState> addProductFormKey = GlobalKey<FormState>();

  bool buttonPressed = false;
  bool isActive = false;
  void  toggleActivity(bool? value) {
    isActive = value!;
    update();
  }

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

  String? scanResult;

  Future scanBarcode() async {
    scanResult = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
    update();
  }

}
