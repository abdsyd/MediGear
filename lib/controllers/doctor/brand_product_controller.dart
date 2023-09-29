import 'dart:async';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/models/product_model.dart';
import 'package:hunter/services/remote_services.dart';

class BrandProductsController extends GetxController {
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  bool iconButtonPressed = true;


  late List<ProductModel> products =[] ;


  bool isLoadingProduct = false;
  bool isFetchedProduct = false;

  void setLoadingProduct(bool value) {
    isLoadingProduct = value;
    update();
  }

  void setFetchedProduct(bool value) {
    isFetchedProduct = value;
    update();
  }

  void getAllProducts() async {
    try {
      //setLoadingProduct(true);
      products =
          (await RemoteServices.fetchAllProducts().timeout(kTimeOutDuration2))!;
      //setFetchedProduct(true);
    } on TimeoutException {
      kTimeOutDialog();
    } catch (e) {
      //
    } finally {
      //setLoadingProduct(false);
    }
  }

  int selectionIndex = 0;

  List<bool> isSelected = [true, false];

  void toggleSelections(int newIndex) {
    for (int index = 0; index < isSelected.length; index++) {
      if (index == newIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    update();
  }
}
