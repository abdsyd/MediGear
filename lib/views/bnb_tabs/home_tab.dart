import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/bottom_navigation_bar_controller.dart';
import 'package:hunter/data/compaines_card.dart';
import 'package:hunter/widgets/compaies_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController barController = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              barController.changeTab(4);
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: companiesCards.length,
          itemBuilder: (context, index) => CompaniesCard(
            backgroundImage: companiesCards[index].backgroundImage,
            subTitle: companiesCards[index].subTitle,
            title: companiesCards[index].title,
          ),
        ),
      ),
    );
  }
}
