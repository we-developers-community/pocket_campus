import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Dummy Data
// This data will be fetched from server
Map<String, Map> foodItems = {
  'Fast Food': {
    'icon': FaIcon(FontAwesomeIcons.hamburger),
    'foodDetails': {
      'Burger': 40,
      'Maggi': 20,
    }
  },
  'Indian Food': {
    'icon': FaIcon(FontAwesomeIcons.utensils),
    'foodDetails': {
      'Samosa': 15,
      'Chole Bhature': 40,
      'Pav Bhaji': 40,
    },
  },
  'Extras': {
    'icon': FaIcon(FontAwesomeIcons.iceCream),
    'foodDetails': {
      'Pepsi': 35,
      'Coca Cola': 45,
    },
  },
};


// Generates list of widgets that will be
// placed insided the Column widget
// using the data that will be fetched from server
List<Widget> generateFoodItems(Map<String, Map> foodItems) {
  List<Widget> foodWidgets = [];

  // Loop through the data
  foodItems.forEach((String category, Map categoryDetails) {
    // This list contains children of each `ExpansionTile` widget.
    List<ListTile> foodListTiles = [];

    Widget categoryIcon = categoryDetails['icon'];
    Map foodsMap = categoryDetails['foodDetails'];

    foodsMap.forEach((foodName, foodCost) {
      ListTile foodListItem = ListTile(
        title: Text(foodName),

        trailing: Chip(
          label: Text("₹ " + foodCost.toString()),
        ),
      );

      foodListTiles.add(foodListItem);
    });

    // Widget to represent each category
    Card categoryNameCard = Card(
      elevation: 2.0,

      // Wrapped ExpansionTile with Card to add elevation
      child: ExpansionTile(
        title: Text(category),
        leading: categoryIcon,

        // Assigning ListTiles as this widget's children
        children: foodListTiles,
      ),
    );

    // Add each categoryCard into the `foodWidgets` list
    foodWidgets.add(categoryNameCard);
  });

  return foodWidgets;
}

// The Main widget
class CanteenDetails extends StatelessWidget {
  static const routeName = '/canteen';
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Canteen Menu"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              // for a little headspace 
              SizedBox(height: 10),
              
              ...generateFoodItems(foodItems),
            ],
          ),
        ),
      ),
    );
  }
}
