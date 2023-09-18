import 'package:flutter/material.dart';
import 'package:hunter/views/doctor_home/bnb_tabs/profile_tab.dart';
import 'package:hunter/views/supplier_home/bnb_tabs/dashboard.dart';
import 'package:hunter/views/supplier_home/bnb_tabs/orders.dart';
import 'package:hunter/views/supplier_home/bnb_tabs/products.dart';


List<Widget> supplierBodies = [
  const Dashboard(),
  const Products(),
  const Orders(),
  const ProfileTab(),
];
