import 'package:flutter/material.dart';
import 'package:hunter/views/bnb_tabs/cart_tab.dart';
import 'package:hunter/views/bnb_tabs/home_tab.dart';
import 'package:hunter/views/bnb_tabs/profile_tab.dart';
import 'package:hunter/views/bnb_tabs/search_tab.dart';
import 'package:hunter/views/bnb_tabs/wishlist_tab.dart';

List<Widget> bodies = [
  const HomeTab(),
  const SearchTab(),
  const CartTab(),
  const WishListTab(),
  const ProfileTab(),
];
