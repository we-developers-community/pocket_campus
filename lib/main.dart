import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './ui/communities/communities_detail.dart';
import './ui/communities/communities_list.dart';
import './ui/home/home_screen.dart';
import './ui/canteen/canteen_screen.dart';
import './ui/event_list/event_list_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
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
        primaryColor: Colors.blue,
        buttonColor: Colors.blue,
        primaryColorDark: Colors.blue,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
        ),
      ),

      themeMode: ThemeMode.dark,

      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        CanteenDetails.routeName: (ctx) => CanteenDetails(),
        EventListScreen.routeName: (ctx) => EventListScreen(),
        CommunityListScreen.routeName: (ctx) => CommunityListScreen(),
      },
    );
  }
}
