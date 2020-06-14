import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _theme;

  ThemeChanger(this._theme);

  getTheme() => _theme;

  setTheme(ThemeData theme){
    _theme = theme;

    notifyListeners();
  }
}