import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/supplier/add_product_controller.dart';
import 'package:hunter/widgets/add_product_bottom_sheet.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductController pC = Get.put(AddProductController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            const AddProductBottomSheet(),backgroundColor: Colors.white,
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<AddProductController>(
        builder: (controller) {
          return ListView.builder(
            // todo : add products here instead of this placeholder column
            itemBuilder: (context,index) => const Column(
            children: [
              Image(
                image: AssetImage('assets/images/logo-black.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'tool',
                  ),
                  Text(
                    'alalalala',
                  ),
                  Text(
                    '20.00\$',
                  ),
                ],
              )
            ],
          ),itemCount: 1,);
        }
      ),
    );
  }
}
