import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  static ThemeData myLightMode = ThemeData(
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
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.myPrimary,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.white70,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );

  static ThemeData myDarkMode = ThemeData(
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
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.myPrimary,
      onPrimary: Colors.white,
      secondary: Color(0xff03DAC6),
      onSecondary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.white70,
      background: Color(0xff121212),
      onBackground: Color(0xffA4A4A4),
      surface: Color(0xff1e1e1e),
      onSurface: Color(0xffD7D7D7),
    ),
  );
}
