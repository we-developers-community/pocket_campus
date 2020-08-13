import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_college/ui/campus_map/campus_map.dart';
import 'package:provider/provider.dart';

import './theme_provider/theme_changer.dart';

import './ui/resources/resources.dart';
import './ui/communities/communities_list.dart';
import './ui/home/home_screen.dart';
import './ui/canteen/canteen_screen.dart';
import './ui/events/event_list_screen.dart';
import './ui/events/events.dart';
import './ui/events/event_detail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeMode.light),
      child: MaterialWidget(),
    );
  }
}

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: EventList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pocket Campus',
        theme: ThemeData(
          fontFamily: 'Poppins',
          accentColor: Colors.blue,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.blue,
          buttonColor: Colors.blue,
          primaryColorDark: Colors.blue,
        ),
        darkTheme: ThemeData(
          fontFamily: 'Poppins',
          accentColor: Colors.blue[200],
          brightness: Brightness.dark,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
          ),
        ),
        themeMode: theme.getTheme(),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          CanteenDetails.routeName: (ctx) => CanteenDetails(),
          EventListScreen.routeName: (ctx) => EventListScreen(),
          EventDetailScreen.routeName: (ctx) => EventDetailScreen(),
          CommunityListScreen.routeName: (ctx) => CommunityListScreen(),
          ResourcesScreen.routeName: (ctx) => ResourcesScreen(),
          CampusMapScreen.routeName: (ctx) => CampusMapScreen(),
        },
      ),
    );
  }
}
