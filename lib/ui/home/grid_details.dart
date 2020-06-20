import 'package:flutter/material.dart';
import 'package:pocket_college/ui/resources/resources.dart';

import '../canteen/canteen_screen.dart';
import '../communities/communities_list.dart';
import '../events/event_list_screen.dart';

class GridDetails with ChangeNotifier {
  List<IconData> _icon = [
    Icons.library_books,
    Icons.local_bar,
    Icons.supervisor_account,
    Icons.event,
    Icons.apps,
    Icons.map,
  ];
  List<String> _className = [
    CommunityListScreen.routeName,
    CanteenDetails.routeName,
    CommunityListScreen.routeName,
    EventListScreen.routeName,
    ResourcesScreen.routeName,
    CommunityListScreen.routeName,
  ];

  List<String> _text = [
    'Academics',
    'Canteen',
    'Communities',
    'Events',
    'Resources',
    'Map',
  ];

  get icons {
    return _icon;
  }

  get className {
    return _className;
  }

  get texts {
    return _text;
  }
}
