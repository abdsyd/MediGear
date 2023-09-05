import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/icons.dart';
import 'package:hunter/controllers/products_controller.dart';
import 'package:flutter/cupertino.dart';

class ProductsView extends StatelessWidget {
  ProductsView({super.key});
  final title = Get.arguments;
  @override
  Widget build(BuildContext context) {
    ProductsController pC = Get.put(ProductsController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          const BackButton(
            style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
          ),
          const Spacer(),
          Column(
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
          const Spacer(),
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
            children: [
              GetBuilder<ProductsController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 40,
                    width: 160,
                    child: ToggleButtons(
                      isSelected: controller.isSelected,
                      onPressed: (int newIndex) {
                        controller.toggleSelections(newIndex);
                        controller.selectionRoleIndex = newIndex;
                      },
                      borderRadius: BorderRadius.circular(35),
                      fillColor: AppColors.myPrimary,
                      selectedColor: Colors.white,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Icon(Icons.check_box_outline_blank),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Icon(Icons.display_settings_sharp),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 40,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation:MaterialStateProperty.all<double>(0),
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
                        SizedBox(width: 5,),
                        Text('filter'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GetBuilder<ProductsController>(builder: (controller) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  crossAxisCount: controller.selectionRoleIndex == 0 ? 2 : 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => const Column(
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
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
