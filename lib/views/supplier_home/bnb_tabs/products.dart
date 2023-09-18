import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/widgets/add_product_bottom_sheet.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            AddProductBottomSheet(),backgroundColor: Colors.white,
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
