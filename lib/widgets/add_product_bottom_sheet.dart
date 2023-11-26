import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/controllers/supplier/add_product_controller.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:search_choices/search_choices.dart';

class AddProductBottomSheet extends StatelessWidget {
  const AddProductBottomSheet({super.key});

  //todo: controller is not disposing after closing sheet
  @override
  Widget build(BuildContext context) {
    AddProductController addProductController = Get.put(AddProductController());
    return BottomSheet(
      onClosing: () {},
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: addProductController.addProductFormKey,
            child: Column(
              children: [
                const Text('Add Product'),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<AddProductController>(builder: (controller) {
                  return addProductController.images.isEmpty
                      ? GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Click here to add photo',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            CarouselSlider(
                              items: [
                                ...addProductController.images.map((e) => Image.file(File(e.path))).toList(),
                                GestureDetector(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: Container(
                                    width: 170,
                                    height: 170,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add_photo_alternate_outlined,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                enableInfiniteScroll: false,
                                aspectRatio: 4 / 3,
                                onPageChanged: (i, reason) => controller.setPicIndex(i),
                              ),
                            ),
                            const SizedBox(height: 8),
                            AnimatedSmoothIndicator(
                              activeIndex: controller.picIndex,
                              count: controller.images.length + 1,
                              effect: const WormEffect(dotHeight: 9, dotWidth: 9, activeDotColor: AppColors.myPrimary),
                            )
                          ],
                        );
                }),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.title.text, 4, 100, 'title');
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.title,
                        decoration: const InputDecoration(labelText: 'Title'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.price.text, 1, 1000, "price");
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.price,
                        decoration: const InputDecoration(labelText: 'Price'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.quantity.text, 1, 1000, "quantity");
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.quantity,
                        decoration: const InputDecoration(labelText: 'Quantity'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.sellQty.text, 0, 1000, 'sell Qty');
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.sellQty,
                        decoration: const InputDecoration(labelText: 'Sell Qty'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.maxPurchaseQty.text, 1, 1000, 'max Purchase Qty');
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.maxPurchaseQty,
                        decoration: const InputDecoration(labelText: 'Max Purchase Qty'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.minPurchaseQty.text, 1, 1000, 'min Purchase Qty');
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.minPurchaseQty,
                        decoration: const InputDecoration(labelText: 'Min Purchase Qty'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.weight.text, 1, 100, 'weight');
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.weight,
                        decoration: const InputDecoration(
                          labelText: 'Weight (kg)',
                          suffixText: 'kg',
                          suffixStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.height.text, 1, 100, 'height');
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.height,
                        decoration: const InputDecoration(
                          labelText: 'Height (m)',
                          suffixText: 'm',
                          suffixStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.width.text, 1, 100, 'width');
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.width,
                        decoration: const InputDecoration(
                          labelText: 'Width (m)',
                          suffixText: 'm',
                          suffixStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        validator: (val) {
                          return validateInput2(addProductController.length.text, 1, 100, 'length');
                        },
                        onChanged: (val) {
                          if (addProductController.buttonPressed) {
                            addProductController.addProductFormKey.currentState!.validate();
                          }
                        },
                        controller: addProductController.length,
                        decoration: const InputDecoration(
                          labelText: 'Length (m)',
                          suffixText: 'm',
                          suffixStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                DropdownSearch(
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        hintText: "search",
                        prefix: Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                  ),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Brand",
                      //labelStyle: kTextStyle18,
                      hintText: "choose a brand",
                    ),
                  ),
                  // items: con.companies,
                  // itemAsString: (CompanyModel c) => c.name,
                  // onChanged: (CompanyModel? company) {
                  //   con.setCompany(company!);
                  // },
                  // enabled: !con.enabled,
                ),
                //todo : fix it
                SearchChoices.multiple(
                  displayClearIcon: false,
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 11),
                  items: const [
                    DropdownMenuItem(child: Text('10')),
                    DropdownMenuItem(child: Text('20')),
                    DropdownMenuItem(child: Text('30')),
                  ],
                  //selectedItems: addProductController.selectedItems,
                  hint: "Select Categories",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
                  searchHint: "Select items",
                  onChanged: (value) {
                    addProductController.setSelectedItems(value);
                  },
                  isExpanded: true,
                  selectedValueWidgetFn: (item) {
                    return (Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        item,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ));
                  },
                  selectedAggregateWidgetFn: (List<Widget> list) {
                    return (Column(children: [
                      Text("${list.length} items selected"),
                      Wrap(children: list),
                    ]));
                  },
                ),
                TextFormField(
                  validator: (val) {
                    return validateInput2(addProductController.description.text, 10, 1000, 'Description');
                  },
                  onChanged: (val) {
                    if (addProductController.buttonPressed) {
                      addProductController.addProductFormKey.currentState!.validate();
                    }
                  },
                  controller: addProductController.description,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    addProductController.scanBarcode();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<AddProductController>(builder: (controller) {
                          return Text(controller.scanResult == null ? 'Scan Barcode' : controller.scanResult!);
                        }),
                        const Icon(CupertinoIcons.barcode),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Active: ',
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                    ),
                    GetBuilder<AddProductController>(builder: (con) {
                      return Checkbox(
                        value: con.isActive,
                        onChanged: (value) {
                          con.toggleActivity(value);
                        },
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.myPrimary),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: AppColors.myWhite),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
