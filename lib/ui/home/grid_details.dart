import 'package:flutter/material.dart';

import '../canteen/canteen_screen.dart';
import '../communities/communities_list.dart';
import '../event_list/event_list_screen.dart';

class GridDetails with ChangeNotifier {
  List<IconData> _icon = [
    Icons.library_books,
    Icons.local_bar,
    Icons.supervisor_account,
    Icons.event,
    Icons.apps,
    Icons.map,
  ];
  List<String> _class = [
    CommunityListScreen.routeName,
    CanteenDetails.routeName,
    CommunityListScreen.routeName,
    EventListScreen.routeName,
    CommunityListScreen.routeName,
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
    return _class;
  }

  get texts {
    return _text;
  }
}
