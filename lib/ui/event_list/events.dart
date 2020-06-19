import 'package:flutter/material.dart';

class Event with ChangeNotifier {
  String title;
  String description;
  String venue;
  DateTime date;

  Event({this.title, this.description, this.date, this.venue});

  List<Event> _eventList = [
    Event(
      title: 'Samvid hackathon',
      description: '',
      venue: '',
      date: DateTime.utc(2020, 2, 9, 20, 0, 0),
    ),
  ];

  List<Event> get eventList {
    return _eventList;
  }
}
