import 'package:flutter/material.dart';
import 'package:news_app_c14/Core/remote/local/sharedpreferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  switchTheme(ThemeMode newTheme) {
    themeMode = newTheme;
    notifyListeners();
  }

  init() {
    var response = SaveTheme.getTheme();
    if (response == false) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
  }
}
