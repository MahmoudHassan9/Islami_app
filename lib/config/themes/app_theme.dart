import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.mainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        size: 45,
      ),
      selectedItemColor: ColorsManager.selectedItemColor,
      unselectedItemColor: ColorsManager.unSelectedItemColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: ColorsManager.mainColor,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),

    ),
    dividerTheme: const DividerThemeData(
      color: ColorsManager.mainColor,
      thickness: 3,
    ),
  );
}
