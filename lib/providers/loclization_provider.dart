import 'package:flutter/material.dart';

class LoclizationProvider extends ChangeNotifier {
  String languageCode = 'en';

  void changeLanguage(String? value) {
    languageCode = value ?? languageCode;
    notifyListeners();
  }
}
