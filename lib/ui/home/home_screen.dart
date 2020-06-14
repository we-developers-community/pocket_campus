import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_changer.dart';

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
                ? Icon(Icons.brightness_low)
                : Icon(Icons.brightness_high),
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
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQuery.size.height * 0.28,
              width: mediaQuery.size.width,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(15),
              ),
              child: null,
            ),
            Container(
              height: mediaQuery.size.height * 0.35,
              width: mediaQuery.size.width,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemBuilder: (ctx, item) => Container(
                  child: Text(''),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
