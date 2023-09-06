import 'package:flutter/material.dart';
import 'package:hunter/views/home/bnb_tabs/cart_tab.dart';
import 'package:hunter/views/home/bnb_tabs/explore_tab.dart';
import 'package:hunter/views/home/bnb_tabs/profile_tab.dart';
import 'package:hunter/views/home/bnb_tabs/search_tab.dart';
import 'package:hunter/views/home/bnb_tabs/wishlist_tab.dart';

List<Widget> bodies = [
  const ExploreTab(),
  const SearchTab(),
  const CartTab(),
  const WishListTab(),
  const ProfileTab(),
];
