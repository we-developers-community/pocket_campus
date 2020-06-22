import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './events.dart';

import 'package:add_2_calendar/add_2_calendar.dart';

class EventListScreen extends StatelessWidget {
  static const routeName = '/events';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    List events = Provider.of<EventList>(context).eventList;

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
        body: Container(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (ctx, index) => Container(
                child: Column(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(''),
                ),
                Container(
                  child: Text(''),
                ),
              ],
            )),
          ),
        ));
  }
}
