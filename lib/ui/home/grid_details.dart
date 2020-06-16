import 'package:flutter/material.dart';

class GridDetails with ChangeNotifier {
  List<IconData> _icon = [
    Icons.library_books,
    Icons.local_bar,
    Icons.supervisor_account,
    Icons.event,
    Icons.apps,
    Icons.map,

  ] ;
  List<String> _url;

  List<String> _text =[
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

  get urls {
    return _url;
  }

   get texts {
    return _text;
  }
}