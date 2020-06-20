import 'package:flutter/material.dart';

class Events with ChangeNotifier {
  String id;
  String title;
  String description;
  String url;
  String venue;
  DateTime date;

  Events({this.id, this.title, this.description,this.url, this.date, this.venue});

  List<Events> _eventList = [
    Events(
      id:'PCE1',
      title: 'Samvid hackathon',
      description: '',
      url:'',
      venue: '',
      date: DateTime.utc(2020, 2, 9, 20, 0, 0),
    ),
  ];

  List<Events> get eventList {
    return _eventList;
  }
}
