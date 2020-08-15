import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocket_college/helpers/theme_defaults.dart';
import 'package:pocket_college/ui/campus_map/campus_map.dart';
import 'package:pocket_college/ui/canteen/canteen_screen.dart';
import 'package:pocket_college/ui/communities/communities_list.dart';
import 'package:pocket_college/ui/events/event_list_screen.dart';
import 'package:pocket_college/ui/resources/resources.dart';
import 'package:pocket_college/helpers.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool darktheme = Theme.of(context).brightness == Brightness.dark;

    Color bulbColor = Colors.blue.shade50;
    ColorFilter carouselColorFilter =
        ColorFilter.mode(Colors.white, BlendMode.darken);
    List<Color> colorGradients = [Colors.blue, Colors.indigoAccent];
    Color shadowColor = Colors.grey.shade500;

    // Values for dark theme
    if (darktheme) {
      bulbColor = Colors.grey[400];
      carouselColorFilter =
          ColorFilter.mode(Colors.transparent, BlendMode.luminosity);
      colorGradients = [Colors.grey.shade700, Colors.grey.shade800];
      shadowColor = Colors.grey.shade900;
    }

    final mediaQuery = MediaQuery.of(context);

    final carouselImgList = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkaqXbA0rN7lUU5jqZwCgKzk8vEOpdZv1FVPVEuDKoFylXpwJt&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6h78lYHp1wlzfY7a-TG3d6_my8KCy-9I3Cg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT3ZeqJx4xeIkrsJW5EJKXFukGYhCnyYGKl6A&usqp=CAU',
    ];

    final newGrid = [
      {
        'name': 'Academics',
        'class': CommunityListScreen.routeName,
        'icon': Icons.library_books,
      },
      {
        'name': 'Canteen',
        'class': CanteenDetails.routeName,
        'icon': Icons.local_bar,
      },
      {
        'name': 'Communities',
        'class': CommunityListScreen.routeName,
        'icon': Icons.supervisor_account,
      },
      {
        'name': 'Events',
        'class': EventListScreen.routeName,
        'icon': Icons.event,
      },
      {
        'name': 'Resources',
        'class': ResourcesScreen.routeName,
        'icon': Icons.apps,
      },
      {
        'name': 'Map',
        'class': CampusMapScreen.routeName,
        'icon': Icons.map,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pocket Campus'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.wb_incandescent,
              color: bulbColor,
            ),
            onPressed: () {
              
              if (darktheme) {
                setGlobalTheme(ThemeMode.light);
              } else {
                setGlobalTheme(ThemeMode.dark);
              }

            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AboutDialog(
                    applicationIcon: ClipRRect(
                      borderRadius: BorderRadius.circular(45 / 2),
                      child: Image.asset(
                        "assets/icon.png",
                        height: 45,
                        width: 45,
                      ),
                    ),
                    applicationName: "Pocket Campus",
                    applicationLegalese: "Copyright 2020",
                    applicationVersion: "v1.0",
                    children: <Widget>[
                      SizedBox(height: 15),
                      Divider(
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Text("💾 Project's"),
                          GestureDetector(
                            child: Text(
                              " Github",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () {
                              launchURL(
                                  "https://github.com/we-developers-community/pocket_college");
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "✨ Our",
                                ),
                                GestureDetector(
                                  child: Text(
                                    " contributors",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onTap: () => launchURL(
                                      "https://github.com/we-developers-community/pocket_college/graphs/contributors"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        height: mediaQuery.size.height * 0.9,
        width: mediaQuery.size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQuery.size.height * 0.35,
              width: mediaQuery.size.width,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ColorFiltered(
                  colorFilter: carouselColorFilter,
                  child: CarouselSlider.builder(
                    itemCount: carouselImgList.length,
                    itemBuilder: (context, index1) => Container(
                      height: mediaQuery.size.height * 0.3,
                      width: mediaQuery.size.width,
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 2.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(
                            carouselImgList[index1],
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInOut,
                      scrollDirection: Axis.horizontal,
                      aspectRatio: 4 / 3,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      enlargeCenterPage: true,
                    ),
                  )
                  // Carousel(
                  //   boxFit: BoxFit.fill,
                  //   autoplay: true,
                  //   autoplayDuration: Duration(seconds: 10),
                  //   borderRadius: true,
                  //   radius: Radius.circular(16),
                  //   animationCurve: Curves.fastOutSlowIn,
                  //   animationDuration: Duration(milliseconds: 2500),
                  //   dotSize: 5.0,
                  //   dotIncreasedColor: Colors.blue,
                  //   dotBgColor: Colors.transparent,
                  //   dotVerticalPadding: 10.0,
                  //   showIndicator: true,
                  //   indicatorBgPadding: 7.0,
                  //   images: [
                  //     NetworkImage(
                  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkaqXbA0rN7lUU5jqZwCgKzk8vEOpdZv1FVPVEuDKoFylXpwJt&usqp=CAU'),
                  //     NetworkImage(
                  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6h78lYHp1wlzfY7a-TG3d6_my8KCy-9I3Cg&usqp=CAU'),
                  //     NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT3ZeqJx4xeIkrsJW5EJKXFukGYhCnyYGKl6A&usqp=CAU'),
                  //   ],
                  // ),
                  ),
            ),
            // Container(
            //   height: mediaQuery.size.height * 0.3,
            //   width: mediaQuery.size.width,
            //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: colorGradients,
            //     ),
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(15),
            //     child: ColorFiltered(
            //       colorFilter: carouselColorFilter,
            //       child: Image.network(
            //         'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkaqXbA0rN7lUU5jqZwCgKzk8vEOpdZv1FVPVEuDKoFylXpwJt&usqp=CAU',
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemCount: newGrid.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                  itemBuilder: (ctx, index) => InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(newGrid[index]['class']);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 2.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(colors: colorGradients),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            newGrid[index]['icon'],
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            // '${gridDetails.texts[index]}'
                            '${newGrid[index]['name']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              // letterSpacing: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
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
