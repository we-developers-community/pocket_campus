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
      url:'https://res.cloudinary.com/ideation/image/upload/dpr_auto,w_470/y02ng62qp1b8ec4k8w1g',
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


