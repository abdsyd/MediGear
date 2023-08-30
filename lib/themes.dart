import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';

class AppTheme {
  static ThemeData englishTheme = ThemeData(
    primaryColor: AppColors.myPrimary,
    fontFamily: 'PlayfairDisplay',
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.myWhite),
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 40, color: AppColors.myWhite),
      bodyLarge: TextStyle(height: 1.5, color: AppColors.myWhite, fontSize: 12),
    ),

    useMaterial3: true,
  );

  static ThemeData arabicTheme = ThemeData(
    primaryColor: AppColors.myPrimary,
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
