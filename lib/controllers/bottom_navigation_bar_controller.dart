import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    _currentIndex = index;
    update();
  }
}
