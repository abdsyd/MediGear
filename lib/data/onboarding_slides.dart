import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel>? getPages = [
  //todo : translate the text here
  PageViewModel(
    title: "Welcome to MEDIGEAR",
    body:
        "Enter the world of dental excellence with MEDIGEAR, your trusted partner for top-quality tools and equipment, dedicated to meeting the needs of dental professionals like you.",
    image: Image.asset("assets/images/logo-nobackground.png"),
    decoration: getPageDecoration(),
  ),
  PageViewModel(
    title: "Streamlined Ordering",
    body:
        "Ordering dental supplies is now incredibly convenient with MEDIGEAR. Browse our catalog, select what you need, and complete your purchase with a few taps. Say goodbye to complexity, hello to efficiency.",
    image: Image.asset("assets/images/ordering.png"),
    decoration: getPageDecoration(),
  ),
  PageViewModel(
    title: "Special Offers",
    body:
        "At MEDIGEAR, we value your loyalty. As a valued customer, you'll access exclusive discounts and promotions to save on essential dental tools. Watch for our regular deals – your budget will thank you.",
    image: Image.asset("assets/images/discount.png"),
    decoration: getPageDecoration(),
  ),
  PageViewModel(
    title: "Let's Get Started",
    body:
        "Ready to enhance your dental practice? Explore MEDIGEAR's premium dental tools and equipment catalog. From precision instruments to cutting-edge tech, it's all a tap away. Start shopping today for a transformative experience.",
    image: Image.asset(
      "assets/images/logo-icon.png",
    ),
    decoration: getPageDecoration(),
  ),
];

PageDecoration getPageDecoration() => const PageDecoration(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.black45,
      ),
    );
