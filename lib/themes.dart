import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';


class AppTheme {
  static ThemeData myEnglishLightMode = ThemeData(
    primaryColor: AppColors.myPrimary,
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: AppColors.myWhite,
      ),
      displayMedium: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'PlayfairDisplay',
        height: 1.5,
        color: Colors.black,
        fontSize: 12,
      ),
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


  static ThemeData myEnglishDarkMode = ThemeData(
    primaryColor: AppColors.myPrimary,

    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: AppColors.myWhite,
      ),
      displayMedium: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
        fontSize: 40,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'PlayfairDisplay',
        height: 1.5,
        color: Colors.black,
        fontSize: 12,
      ),
    ),
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.myPrimary,
      onPrimary: Colors.black,
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
