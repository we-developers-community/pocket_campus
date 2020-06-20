import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  static const routeName = '/event-detail';
  @override
  Widget build(BuildContext context) {
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
              tag: '',
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
