import 'dart:async';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/models/product_model.dart';
import 'package:hunter/services/remote_services.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController({required this.product});

  @override
  void onInit() {
    getAProduct();
    super.onInit();
  }

  int _qty = 1;
  int get qty => _qty;

  void increaseQty() {
    if (_qty < product.maxPurchaseQty) {
      _qty++;
      update();
    }
  }

  void decreaseQty() {
    if (_qty > product.minPurchaseQty) {
      _qty--;
      update();
    }
  }

  late ProductModel product;

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

  void getAProduct() async {
    try {
      //setLoadingProduct(true);
      product = (await RemoteServices.fetchAProduct(product.id).timeout(kTimeOutDuration2))!;
      //setFetchedProduct(true);
    } on TimeoutException {
      kTimeOutDialog();
    } catch (e) {
      //
    } finally {
      //setLoadingProduct(false);
    }
  }

  int _picIndex = 0;
  int get picIndex => _picIndex;
  void setPicIndex(int i) {
    _picIndex = i;
    update();
  }
}
