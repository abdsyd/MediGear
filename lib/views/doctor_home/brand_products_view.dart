import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/icons.dart';
import 'package:hunter/controllers/doctor/brand_product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:hunter/widgets/product_card.dart';

class BrandProductsView extends GetView<BrandProductsController> {
  BrandProductsView({super.key});
  final title = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '150 Products',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyIcon.search,
              size: 18,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GetBuilder<BrandProductsController>(builder: (controller) {
                return SizedBox(
                  height: 40,
                  width: 160,
                  child: ToggleButtons(
                    isSelected: controller.isSelected,
                    onPressed: (int newIndex) {
                      controller.toggleSelections(newIndex);
                      controller.selectionIndex = newIndex;
                    },
                    borderRadius: BorderRadius.circular(35),
                    fillColor: AppColors.myPrimary,
                    selectedColor: Colors.white,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Icon(Icons.grid_view),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Icon(Icons.view_stream),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 40,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all<double>(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(CupertinoIcons.slider_horizontal_3),
                      SizedBox(
                        width: 5,
                      ),
                      Text('filter'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GetBuilder<BrandProductsController>(builder: (controller) {
              return GridView.builder(
                itemCount: controller.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  crossAxisCount: controller.selectionIndex == 0 ? 2 : 1,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => ProductCard(
                  product: controller.products[index],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
