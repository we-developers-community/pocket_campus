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
      title:'Samvid hackathon',
      description: 'lorem ipsum dolor sit amet',
      url:'https://secureservercdn.net/160.153.137.99/v4u.ca9.myftpupload.com/wp-content/uploads/Hack-A-Thon-2020-960x607.jpg',
      venue: 'SSTC Central Library',
    ),
  ];

  List<EventDetail> get eventList {
    return _eventList;
  }

  EventDetail findById(id) {
    return _eventList.firstWhere((element) => element.id == id);
  }
}


