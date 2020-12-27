import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/services.dart';
import 'package:pocket_college/ui/campus_map/campus_map.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import './ui/resources/resources.dart';
import './ui/communities/communities_list.dart';
import './ui/communities/communities.dart';
import './ui/communities/communities_detail.dart';
import './ui/home/home_screen.dart';
import './ui/canteen/canteen_screen.dart';
import './ui/events/event_list_screen.dart';
import './ui/events/events.dart';
import './ui/events/event_detail_screen.dart';
import 'helpers/theme_defaults.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
          home: AnimatedSplash(
        imagePath: 'assets/icon.png',
        home: RootApp(),
        duration: 1500,
        type: AnimatedSplashType.StaticDuration,
      )),
    );
  });
}

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  void initState() {
    super.initState();
    setInitialThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CommunityList(),
        ),
        ChangeNotifierProvider.value(
          value: EventList(),
        ),
      ],
      child: GetMaterialApp(
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
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          CanteenDetails.routeName: (ctx) => CanteenDetails(),
          EventListScreen.routeName: (ctx) => EventListScreen(),
          EventDetailScreen.routeName: (ctx) => EventDetailScreen(),
          CommunityListScreen.routeName: (ctx) => CommunityListScreen(),
          CommunitiesDetailScreen.routeName: (ctx) => CommunitiesDetailScreen(),
          ResourcesScreen.routeName: (ctx) => ResourcesScreen(),
          CampusMapScreen.routeName: (ctx) => CampusMapScreen(),
        },
      ),
    );
  }
}
