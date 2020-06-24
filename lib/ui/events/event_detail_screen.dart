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
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Text(loadedEvent.title,),
            background: Hero(
              transitionOnUserGestures: true,
              tag: loadedEvent.id,
              child: Image.network(
                loadedEvent.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 600,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: 300,
                child: Text(loadedEvent.description),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
