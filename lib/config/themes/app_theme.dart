import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.lightMainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        size: 45,
      ),
      selectedItemColor: ColorsManager.lightSelectedItemColor,
      unselectedItemColor: ColorsManager.lightUnSelectedItemColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: ColorsManager.lightMainColor,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: ColorsManager.lightMainColor,
      thickness: 3,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: ColorsManager.darkMainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        size: 45,
      ),
      selectedItemColor: ColorsManager.darkSelectedItemColor,
      unselectedItemColor: ColorsManager.darkUnSelectedItemColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: ColorsManager.darkBottomNavColor,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
      labelSmall: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
      bodyMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    dividerTheme: const DividerThemeData(
      color: ColorsManager.darkMainColor,
      thickness: 3,
    ),
  );
}
