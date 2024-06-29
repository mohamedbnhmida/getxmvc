import 'package:flutter/material.dart';
import 'package:flutter_mvc_getx/utils/app_colors.dart';
import 'package:flutter_mvc_getx/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc_getx/utils/app_colors.dart';
import 'package:flutter_mvc_getx/utils/app_fonts.dart';

class AppTheme {
  // Light theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.secondaryColor,
    fontFamily: AppFonts.primaryFont,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.purple,  
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,  
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: AppColors.textColorLight,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: AppColors.textColorLight,
        fontSize: 14,
      ),
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 238, 0, 16),
    accentColor: AppColors.secondaryColor,
    fontFamily: AppFonts.primaryFont,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 238, 0, 0),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,  
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: AppColors.textColorDark,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: AppColors.textColorDark,
        fontSize: 14,
      ),
    ),
  );
}
