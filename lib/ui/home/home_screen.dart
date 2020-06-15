import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme_provider/theme_changer.dart';

import './home_light.dart';
import './home_dark.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool darktheme = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pocket Campus'),
        actions: <Widget>[
          IconButton(
            icon: darktheme
                ? Icon(
                    Icons.wb_incandescent,
                    color: Colors.purple,
                  )
                : Icon(
                    Icons.wb_incandescent,
                    color: Colors.yellowAccent,
                  ),
            onPressed: () {
              if (darktheme == false) {
                themeChanger.setTheme(ThemeMode.dark);
                setState(() {
                  darktheme = true;
                });
                print(darktheme);
              } else {
                themeChanger.setTheme(ThemeMode.light);
                setState(() {
                  darktheme = false;
                });
              }
            },
          )
        ],
      ),
      body: Container(
        height: mediaQuery.size.height * 0.9,
        width: mediaQuery.size.width,
        child: darktheme ? HomeDark() : HomeLight(),
      ),
    );
  }
}
