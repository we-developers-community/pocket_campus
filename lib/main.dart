import 'package:flutter/material.dart';
import 'package:pocket_college/screens/canteen_screen/canteen_screen.dart';

import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pocket Campus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName : (ctx) => HomeScreen(),
      },
    );
  }
}

