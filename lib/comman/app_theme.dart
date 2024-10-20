import 'package:flutter/material.dart';
import 'package:todo_app/comman/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
          titleLarge:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(
              color: AppColors.bottonBarDark, fontWeight: FontWeight.w700)),
      appBarTheme: AppBarTheme(
          color: AppColors.primaryColor,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0),
      scaffoldBackgroundColor: AppColors.pgLightColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey.withOpacity(.4),
          selectedIconTheme:
              IconThemeData(color: AppColors.primaryColor, size: 30),
          unselectedIconTheme:
              IconThemeData(color: Colors.grey.withOpacity(.4), size: 30),
          showSelectedLabels: false,
          showUnselectedLabels: false),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: const CircleBorder(
              side: BorderSide(color: Colors.white, width: 5))),
    );

  static ThemeData darkTheme = ThemeData(
      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: AppColors.pgDarkColor, fontWeight: FontWeight.w700),
          titleSmall: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700)),
      appBarTheme: AppBarTheme(
          color: AppColors.primaryColor,
          foregroundColor: AppColors.bottonBarDark,
          centerTitle: false,
          elevation: 0),
      scaffoldBackgroundColor: AppColors.pgDarkColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.bottonBarDark,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.white,
          selectedIconTheme:
              IconThemeData(color: AppColors.primaryColor, size: 30),
          unselectedIconTheme:
              const IconThemeData(color: Colors.white, size: 30),
          showSelectedLabels: false,
          showUnselectedLabels: false),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: CircleBorder(
              side: BorderSide(color: AppColors.bottonBarDark, width: 5))));
}
