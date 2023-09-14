import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/home/home_controller.dart';
import 'package:hunter/data/compaines_card.dart';
import 'package:hunter/widgets/compaies_card.dart';


class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hC = Get.find();
    SearchController sC = Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('Search'.tr),
        actions: [
          IconButton(
            onPressed: () {
              hC.changeTab(4);
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
