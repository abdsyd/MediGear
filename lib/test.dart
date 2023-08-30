import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/icons.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: AuthButton(
              onPressed: () {},
              child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.white, size: 40)),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  [
          BottomNavigationBarItem(icon: Icon(MyIcon.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(MyIcon.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(MyIcon.shopping_bag), label: 'bag'),
          BottomNavigationBarItem(
              icon: Icon(MyIcon.heart_empty), label: 'wishlist'),
          BottomNavigationBarItem(icon: Icon(MyIcon.user_outline), label: 'profile'),
        ],
        iconSize: 20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.myPrimary,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _currentindex,
        onTap: (index){
          setState(() {

              _currentindex=index;

          });
        },
      ),
    );
  }
}
