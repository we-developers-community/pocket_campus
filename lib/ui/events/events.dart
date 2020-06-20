import 'package:flutter/material.dart';

class EventDetail {
  String id;
  String title;
  String description;
  String url;
  String venue;


  EventDetail({this.id, this.title, this.description,this.url, this.venue});
}

class EventList with ChangeNotifier{
  List<EventDetail> _eventList = [
    EventDetail(
      id:'PCE1',
      title: 'Samvid hackathon',
      description: '',
      url:'',
      venue: '',
      
    ),
  ];

  List<EventDetail> get eventList {
    return _eventList;
  }
}


