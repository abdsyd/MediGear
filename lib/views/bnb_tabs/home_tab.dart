import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/bottom_navigation_bar_controller.dart';

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
        child: ListView(
          children: [
            Container(
              height: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(image: AssetImage('assets/images/logo-color.png'),fit: BoxFit.cover),
              ),
              child: const Align(alignment: Alignment.bottomLeft,child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('legacy',textAlign: TextAlign.start,),
              ),),
            ),
            Container(
              height: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(image: AssetImage('assets/images/logo-color.png'),fit: BoxFit.cover),
              ),
              child: const Align(alignment: Alignment.bottomLeft,child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('legacy',textAlign: TextAlign.start,),
              ),),
            ),
            Container(
              height: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(image: AssetImage('assets/images/logo-color.png'),fit: BoxFit.cover),
              ),
              child: const Align(alignment: Alignment.bottomLeft,child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('legacy',textAlign: TextAlign.start,),
              ),),
            ),
            Container(
              height: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(image: AssetImage('assets/images/logo-color.png'),fit: BoxFit.cover),
              ),
              child: const Align(alignment: Alignment.bottomLeft,child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('legacy',textAlign: TextAlign.start,),
              ),),
            ),
            Container(
              height: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(image: AssetImage('assets/images/logo-color.png'),fit: BoxFit.cover),
              ),
              child: const Align(alignment: Alignment.bottomLeft,child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('legacy',textAlign: TextAlign.start,),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
