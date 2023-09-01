import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/views/bnb_tabs/cart_tab.dart';
import 'package:hunter/views/bnb_tabs/home_tab.dart';
import 'package:hunter/views/bnb_tabs/profile_tab.dart';
import 'package:hunter/views/bnb_tabs/search_tab.dart';
import 'package:hunter/views/bnb_tabs/wishlist_tab.dart';

class BottomNavigationBarController extends GetxController {

  List<Widget> bodies = [
    const HomeTab(),
    const SearchTab(),
    const CartTab(),
    const WishListTab(),
    const ProfileTab(),
  ];


  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    _currentIndex = index;
    update();
  }
}
