import 'package:flutter/material.dart';

class Events with ChangeNotifier {
  String title;
  String description;
  String venue;
  DateTime date;

  Events({this.title, this.description, this.date, this.venue});

  List<Events> _eventList = [
    Events(
      title: 'Samvid hackathon',
      description: '',
      venue: '',
      date: DateTime.utc(2020, 2, 9, 20, 0, 0),
    ),
  ];

  List<Events> get eventList {
    return _eventList;
  }
}
