import 'package:get/get.dart';
import 'package:hunter/models/product_model.dart';

class ProductController extends GetxController {
  ProductController({required this.product});
  final ProductModel product;

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

  int _picIndex = 0;
  int get picIndex => _picIndex;
  void setPicIndex(int i) {
    _picIndex = i;
    update();
  }
}
