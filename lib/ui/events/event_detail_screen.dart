import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './events.dart';

class EventDetailScreen extends StatelessWidget {
  static const routeName = '/event-detail';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as String;
    var loadedEvent = Provider.of<EventList>(context).findById(args); 
    return Scaffold(
        // appBar: AppBar(
        //    title: Text(''),
        // ),
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(''),
            background: Hero(
              tag: loadedEvent.id,
              child: Image.network(
                '',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 300,
                width: 300,
                child: Text('description'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
