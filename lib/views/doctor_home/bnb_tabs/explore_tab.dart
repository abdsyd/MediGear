import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/controllers/doctor/bnb_tabs/explore_controller.dart';
import 'package:hunter/controllers/doctor/home_controller.dart';

final List<String> imgList = [
  'assets/images/banner-01.jpg',
  'assets/images/banner-02.jpg',
  'assets/images/banner-03.jpg',
];

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.find();
    ExploreController eC = Get.put(ExploreController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Explore'.tr),
          actions: [
            IconButton(
              onPressed: () {
                hC.changeTab(4);
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider(
                items: imgList
                    .map((e) => Image.asset(
                          e,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: true, enlargeCenterPage: true, aspectRatio: 2.0),
              ),
              const Text("what would you like to buy ?"),
              Container(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding:const EdgeInsets.all(5) ,
                      width: 70,
                      margin: const EdgeInsets.all(5),
                      color: AppColors.myPrimary,
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.ac_unit,color: Colors.white,),
                            Text('Category',overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
