import 'package:flutter/material.dart';

import 'package:add_2_calendar/add_2_calendar.dart';

class EventListScreen extends StatelessWidget {

  // Dummy event details
  final Event event = Event(
    title: 'Samvid Hackathon 3.0',
    startDate: DateTime.utc(2020, 6, 13),
    endDate: DateTime.utc(2020, 6, 13),
    allDay: true,
    description: 'Annual Hackathon at SSTC Bhilai.',
  );

  static const routeName = '/events';
  
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.event),
        title: Text('Events'),
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.symmetric( horizontal: 20.0),
        //     child: Icon(Icons.event, size: 26,),
        //   ),
        // ],
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(5.0),
              onTap: () {
                print('Hello World');
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: NetworkImage(
                              'https://secureservercdn.net/160.153.137.99/v4u.ca9.myftpupload.com/wp-content/uploads/Hack-A-Thon-2020-1024x576.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(event.title),
                          SizedBox(height: 5),
                          Text(event.description),
                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              RaisedButton.icon(
                                onPressed: () {},
                                color: Theme.of(context).primaryColor,
                                icon: Icon(
                                  Icons.link,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              FlatButton(
                                onPressed: () {
                                  // add event to calendar
                                  Add2Calendar.addEvent2Cal(event);
                                },
                                child: Text('Add to Calendar'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
