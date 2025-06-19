import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c14/Core/resources/ColorManager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: ColorManager.whiteColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: ColorManager.blackColor,
          titleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorManager.blackColor
          )
      ),
      drawerTheme: DrawerThemeData(
          backgroundColor: ColorManager.blackColor
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: ColorManager.blackColor
        ),

        bodyMedium: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: ColorManager.whiteColor
        ),

        titleSmall: TextStyle(
            color: ColorManager.blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700
        ),

        bodySmall: TextStyle(
            color: ColorManager.greyColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500
        ),

        bodyLarge: TextStyle(
            color: ColorManager.whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500
        ),
      ),

    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorManager.whiteColor,

        onPrimary: ColorManager.whiteColor,
      primary: ColorManager.blackColor
    )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorManager.blackColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: ColorManager.whiteColor,
          titleTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorManager.whiteColor
          )
      ),
      drawerTheme: DrawerThemeData(
          backgroundColor: ColorManager.blackColor
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: ColorManager.whiteColor
        ),

        bodyMedium: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: ColorManager.blackColor
        ),

        titleSmall: TextStyle(
            color: ColorManager.whiteColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700
        ),

        bodySmall: TextStyle(
            color: ColorManager.greyColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500
        ),

        bodyLarge: TextStyle(
            color: ColorManager.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500
        ),
      ),

      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.blackColor,

          onPrimary: ColorManager.blackColor,
          primary: ColorManager.whiteColor
      )
  );
}