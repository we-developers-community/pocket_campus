import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocket_college/helpers.dart';

List<Map> resourcesList = [
  {
    'name': 'Tech related resource',
    'icon': Icon(Icons.devices_other),
    'link': 'https://example.com',
    'branch': 'cse',
  },
  {
    'name': 'Mechanical related',
    'icon': FaIcon(FontAwesomeIcons.toolbox),
    'link': 'https://example.com',
    'branch': 'mech',
  },
  {
    'name': 'Chemistry related title',
    'icon': FaIcon(FontAwesomeIcons.cubes),
    'link': 'https://example.com',
    'branch': '1st',
  },
  {
    'name': 'Maths related',
    'icon': FaIcon(FontAwesomeIcons.chartBar),
    'link': 'https://example.com',
    'branch': 'mech',
  },
  {
    'name': 'Again a Tech related resource',
    'icon': Icon(Icons.devices_other),
    'link': 'https://example.com',
    'branch': 'cse',
  },
];

List<Widget> getWidgetListOfResources(List<Map> resourcesList) {
  List<Widget> widgetList = [];

  for (Map resource in resourcesList) {
    Widget listWidget = Card(
      elevation: 5,
      child: ListTile(
        title: Text(resource['name']),
        subtitle: Text(resource['link']),
        onTap: () => launchURL(resource['link']),
        leading: resource['icon'],
      ),
    );

    widgetList.add(listWidget);

    // adding spacing between list items
    widgetList.add(
      SizedBox(
        height: 5,
      ),
    );
  }

  return widgetList;
}



class ResourcesScreen extends StatelessWidget {
  static final routeName = '/resources';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resources"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            ...getWidgetListOfResources(resourcesList),
          ],
        ),
      ),
    );
  }
}
