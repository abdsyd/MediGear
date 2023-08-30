import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {

  PageController pageController = PageController();

  int _currentIndex = 0; // initial scaffold body index (home tab)
  int get currentIndex => _currentIndex; // getter


  void changeTab(int index) {
    _currentIndex = index;
    update();
  }
}
