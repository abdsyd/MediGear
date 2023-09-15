import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/data/onboarding_slides.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingView extends StatelessWidget {
   const OnboardingView({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: AppColors.myPrimary,
        pages: getPages,
        onDone: () {
          GetStorage().write('onboarding', true);
          Get.offNamed(AppRoute.login);
        },
        done: const Text(
          'Start',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(color: Colors.grey),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        dotsDecorator: DotsDecorator(
            activeColor: Colors.white,
            activeSize: const Size(20, 7),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35))),
      ),
    );
  }
}
