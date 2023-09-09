import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';
import 'package:get_storage/get_storage.dart';

final _getStorage = GetStorage();

class AppTheme {
  static ThemeData myLightMode = ThemeData(
    primaryColor: AppColors.myPrimary,
    fontFamily:
        _getStorage.read("lang") == "en" ? 'PlayfairDisplay' : 'KufiArabic',
    textTheme: _getStorage.read("lang") == "en"
        ? const TextTheme(
            displayMedium: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
            bodyLarge:
                TextStyle(height: 1.5, color: Colors.black, fontSize: 12),
          )
        : const TextTheme(
            displayMedium: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
            bodyLarge:
                TextStyle(height: 1.5, color: Colors.black, fontSize: 12),
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
    fontFamily:
        _getStorage.read("lang") == "en" ? 'PlayfairDisplay' : 'KufiArabic',
    textTheme: _getStorage.read("lang") == "en"
        ? const TextTheme(
            labelMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: AppColors.myWhite,
            ),
            displayMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
            displayLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.black,
            ),
            bodyLarge: TextStyle(
              height: 1.5,
              color: Colors.black,
              fontSize: 12,
            ),
          )
        : const TextTheme(
            displayMedium: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
            bodyLarge:
                TextStyle(height: 1.5, color: Colors.black, fontSize: 12),
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
