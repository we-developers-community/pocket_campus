import 'package:flutter/material.dart';
import 'package:pocket_college/helpers.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:pocket_college/helpers/theme_defaults.dart';
import 'home/home_screen.dart';

Map themeToIntMap = {
  ThemeMode.system: 1,
  ThemeMode.light: 2,
  ThemeMode.dark: 3,
};

class MySplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  int themeModeInt;
  void assignSplashTheme() async {
    ThemeMode themeMode = await getUserChoosenTheme();
    themeModeInt = themeToIntMap[themeMode];
  }

  @override
  Widget build(BuildContext context) {
    assignSplashTheme();
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: HomeScreen(),
        title: Text(
          'Pocket Campus',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: themeModeInt == 3 ? Colors.white : Colors.black,
          ),
        ),
        image: Image.asset('assets/rounded_icon.png'),
        backgroundColor: themeModeInt == 3 ? Color(0xff192734) : Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 80.0,
        onClick: () => print("Full Engagement"),
        loadingText: Text(
          getRandomFact(),
          style:
              TextStyle(color: themeModeInt == 3 ? Colors.white : Colors.black),
        ),
        loaderColor: Color(0xff76c7ec));
  }
}
