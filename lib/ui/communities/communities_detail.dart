import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './communities.dart';

class CommunitiesDetailScreen extends StatelessWidget {
  static const routeName = '/community-detail';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as String;
    var loadedCommunities = Provider.of<CommunityList>(context).findById(args);
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Text(
              loadedCommunities.title,
            ),
            background: Hero(
              transitionOnUserGestures: true,
              tag: loadedCommunities.id,
              child: Image.network(
                loadedCommunities.url,
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
                  loadedCommunities.description,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Get in touch',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 500,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  loadedCommunities.website,
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
