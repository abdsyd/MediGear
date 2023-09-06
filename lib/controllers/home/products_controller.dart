import 'package:get/get.dart';

class ProductsController extends GetxController {
  int selectionRoleIndex = 0;

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