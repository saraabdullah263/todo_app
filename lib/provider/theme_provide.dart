import 'package:flutter/material.dart';

class ThemeProvide with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  String localeCode = 'en';
 void changeTheme(String theme) {
    if (theme == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners(); 
  }
  ChangeLanguage(String locale){
     localeCode=locale;
     notifyListeners();
  }
}
