import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/comman/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      canvasColor: Colors.white,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.pgLightColor,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryColor,
          onPrimary: Colors.black,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          surface: Colors.white,
          onSurface: Colors.white),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          titleLarge:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(
              color: AppColors.bottonBarDark, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700)),
      appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0),
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
      inputDecorationTheme: const InputDecorationTheme(
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black)),
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.black))));

  static ThemeData darkTheme = ThemeData(
      canvasColor: Colors.black,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.pgDarkColor,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryColor,
          onPrimary: Colors.white,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          surface: Colors.white,
          onSurface: Colors.white),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700),
          titleLarge: TextStyle(
              color: AppColors.pgDarkColor, fontWeight: FontWeight.w700),
          titleSmall: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700)),
      appBarTheme: AppBarTheme(
          color: AppColors.primaryColor,
          foregroundColor: AppColors.bottonBarDark,
          centerTitle: false,
          elevation: 0),
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
              side: BorderSide(color: AppColors.bottonBarDark, width: 5))),
 inputDecorationTheme: const InputDecorationTheme(
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.white)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.white)),
          disabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: Colors.white))));
}

