import 'package:flutter/material.dart';
import 'package:news_app_c14/Core/resources/ColorManager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.whiteColor,
      primary: ColorManager.blackColor
    )
  );
  static ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.blackColor,
          primary: ColorManager.whiteColor
      )
  );
}