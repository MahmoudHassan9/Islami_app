import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  bool isDark = false;

  void changeTheme(bool val) {
    if (val) {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
    isDark = !isDark;
    notifyListeners();
  }

  void saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isDark) {
      prefs.setString('theme', 'isDark');
    } else {
      prefs.setString('theme', 'isLight');
    }
    notifyListeners();
  }

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = prefs.getString('theme') ?? 'isLight';
    print(theme);
    if (theme == 'isDark') {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
    notifyListeners();
  }
}
