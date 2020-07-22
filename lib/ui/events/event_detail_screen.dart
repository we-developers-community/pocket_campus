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
            title: Text(
              loadedEvent.title,
            ),
            background: Hero(
              transitionOnUserGestures: true,
              tag: loadedEvent.id,
              child: Image.network(
                loadedEvent.url,
                fit: BoxFit.cover,
                color: Colors.grey.shade500.withOpacity(0.8),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  loadedEvent.description,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Venue',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 500,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  loadedEvent.venue,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
