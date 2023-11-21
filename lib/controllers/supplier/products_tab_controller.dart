import 'package:get/get.dart';

import '../../models/product_model.dart';

class ProductTabController extends GetxController {
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;
}
