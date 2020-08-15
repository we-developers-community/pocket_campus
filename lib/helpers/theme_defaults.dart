import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

// Mapping of theme modes with integers, these integers are then
// used to identify the theme mode they represent
Map<int, ThemeMode> intToThemeMap = {
  1: ThemeMode.system,
  2: ThemeMode.light,
  3: ThemeMode.dark,
};

Map themeToIntMap = {
  ThemeMode.system: 1,
  ThemeMode.light: 2,
  ThemeMode.dark: 3,
};

// Returns the theme mode users have choosen,
// defaults to system settings
Future<ThemeMode> getUserChoosenTheme() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  int themeModeInt =
      prefs.getInt("APP_THEME") ?? 1; // Return system theme as default

  print("Shared preference = " + themeModeInt.toString());

  ThemeMode userChoosenThemeMode = intToThemeMap[themeModeInt];
  return userChoosenThemeMode;
}

// Set initial theme to the user choosen theme, when the app renders initially
void setInitialThemeMode() async {
  ThemeMode userChoosenTheme = await getUserChoosenTheme();
  print("Initial Theme: " + userChoosenTheme.toString());
  Get.changeThemeMode(userChoosenTheme);
}

// Stores the user preferred theme using shared preferences
void setGlobalTheme(ThemeMode themeMode) async {
  int themeModeInt = themeToIntMap[themeMode];

  Get.changeThemeMode(themeMode);

  final SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setInt("APP_THEME", themeModeInt);
}
