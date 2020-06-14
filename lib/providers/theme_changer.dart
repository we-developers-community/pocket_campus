import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _theme;

  ThemeChanger(this._theme);

  getTheme() => _theme;

  setTheme(ThemeMode theme){
    _theme = theme;

    notifyListeners();
  }
}