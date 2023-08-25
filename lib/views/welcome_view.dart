import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/routes_name.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/MediGear1.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WELCOME',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Welcome to MediGear  Where Dental Tools and Quality Meet! Explore our collection and elevate your dental practice today.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Get.toNamed(AppRoute.login);
                },
                color: AppColors.myBrown,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text("SIGN IN",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Get.toNamed(AppRoute.register);
                },
                color: AppColors.myBrown,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text("SIGN UP",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
