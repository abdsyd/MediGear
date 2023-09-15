import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/widgets/auth_button.dart';

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
                'WELCOME'.tr,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black45),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Welcome to MediGear  Where Dental Tools and Quality Meet! Explore our collection and elevate your dental practice today.'
                    .tr,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black45),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthButton(
                onPressed: () {
                  Get.toNamed(AppRoute.login);
                  //Get.toNamed(AppRoute.home);
                },
                color: Colors.white,
                child: Text(
                  'Sign in'.tr,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.myPrimary),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthButton(
                onPressed: () {
                  Get.toNamed(AppRoute.register);
                },
                color: Colors.white,
                child: Text(
                  'Sign up'.tr,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.myPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
