import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';

class AppTheme {
  static ThemeData englishTheme = ThemeData(
    fontFamily: 'PlayfairDisplay',
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.myWhite),
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 48, color: AppColors.myWhite),
      bodyLarge: TextStyle(height: 1.5, color: AppColors.myWhite, fontSize: 18),
    ),
    useMaterial3: true,
  );

  static ThemeData arabicTheme = ThemeData(
    fontFamily: 'KufiArabic',
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 36, color: Colors.black),
      bodyLarge: TextStyle(height: 1.5, color: Colors.grey, fontSize: 18),
    ),
    useMaterial3: true,
  );
}
