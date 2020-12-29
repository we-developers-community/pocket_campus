import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventDetail {
  String id;
  String title;
  String description;
  String url;
  String venue;

  EventDetail({this.id, this.title, this.description, this.url, this.venue});
}

class EventList with ChangeNotifier {
  List<EventDetail> _eventList = [
    // EventDetail(
    //   id:'PCE1',
    //   title:'Samvid hackathon',
    //   description: 'lorem ipsum dolor sit amet',
    //   url:'https://res.cloudinary.com/ideation/image/upload/dpr_auto,w_470/y02ng62qp1b8ec4k8w1g',
    //   venue: 'SSTC Central Library',
    // ),
  ];

  List<EventDetail> get eventList {
    return _eventList;
  }

  EventDetail findById(id) {
    return _eventList.firstWhere((element) => element.id == id);
  }

  Future<void> getEvents() async {
    const url = 'https://pocket-campus.firebaseio.com/Events.json';

    try {
      final res = await http.get(url);
      final resData = json.decode(res.body) as Map<String, dynamic>;
      resData.forEach(
        (key, value) {
          _eventList.add(
            EventDetail(
              id: key,
              title: value['title'],
              description: value['description'],
              venue: value['venue'],
              url: value['imgUrl'],
            ),
          );
        },
      );
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
