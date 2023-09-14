import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Welcome to MEDIGEAR",
              body: "Discover a wide range of dental tools for your practice.",
              image: Image.asset("assets/images/logo.png"),
            ),
            PageViewModel(
              title: "Browse and Purchase",
              body: "Easily browse and purchase the tools you need.",
              image: Image.asset("assets/images/logo.png"),
            ),
            PageViewModel(
              title: "Start Improving Your Practice",
              body: "Get started today and enhance your dental practice.",
              image: Image.asset("assets/images/logo.png"),
            ),
          ],
          onDone: () {
            Get.offNamed(AppRoute.welcome); // Example: Navigate to the home screen using GetX.
          },
          done: const Text("Get Started"),
          showSkipButton: true,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}