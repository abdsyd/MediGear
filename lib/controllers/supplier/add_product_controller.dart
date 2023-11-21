import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/models/brand_model.dart';
import 'package:hunter/models/category_model.dart';
import 'package:hunter/models/product_model.dart';
import 'package:hunter/services/remote_services.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  final TextEditingController title = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController brand = TextEditingController();
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
  void toggleActivity(bool? value) {
    isActive = value!;
    update();
  }

  int _picIndex = 0;
  int get picIndex => _picIndex;
  void setPicIndex(int i) {
    _picIndex = i;
    update();
  }

  @override
  void onInit() {
    getAllBrands();
    getAllCategories();
    super.onInit();
  }

  late List<BrandModel> brands = [];

  bool isLoadingBrand = false;
  bool isFetchedBrand = false;

  void setLoadingBrand(bool value) {
    isLoadingBrand = value;
    update();
  }

  void setFetchedBrand(bool value) {
    isFetchedBrand = value;
    update();
  }

  void getAllBrands() async {
    try {
      //setLoadingBrand(true);
      brands = (await RemoteServices.fetchAllBrands().timeout(kTimeOutDuration2))!;
      //setFetchedBrand(true);
    } on TimeoutException {
      kTimeOutDialog();
    } catch (e) {
      //
    } finally {
      //setLoadingBrand(false);
    }
  }

  late List<CategoryModel> parentCategories = [];
  late List<CategoryModel> childCategories = [];

  bool isLoadingCategories = false;
  bool isFetchedCategories = false;

  void setLoadingCategories(bool value) {
    isLoadingCategories = value;
    update();
  }

  void setFetchedCategories(bool value) {
    isFetchedCategories = value;
    update();
  }

  void getAllCategories() async {
    try {
      //setLoadingCategories(true);
      //parentCategories = (await RemoteServices.fetchAllParentCategories().timeout(kTimeOutDuration2))!;
      childCategories = (await RemoteServices.fetchAllChildCategories().timeout(kTimeOutDuration2))!;
      //setFetchedCategories(true);
    } on TimeoutException {
      kTimeOutDialog();
    } catch (e) {
      //
    } finally {
      //setLoadingCategories(false);
    }
  }

  //todo: find out how to do this
  Future addProduct() async {
    try {} on TimeoutException {
      kTimeOutDialog();
    } catch (e) {
      //
    } finally {}
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

  List<int> selectedItemsIndexes = [];

  void setSelectedItems(value) {
    selectedItemsIndexes = value;
    update();
  }

  void removeTag(int index) {
    selectedItemsIndexes.remove(index);
    print(selectedItemsIndexes);
    update();
  }
  // f() {
  //   List.generate(
  //     childCategories.length,
  //     (i) => DropdownMenuItem(
  //       value: childCategories[i],
  //       child: Text(
  //         childCategories[i].title,
  //       ),
  //     ),
  //   );
  // }
}
