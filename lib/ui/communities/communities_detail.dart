import 'package:flutter/material.dart';
import 'package:pocket_college/helpers.dart';

class CommunityDetailScreen extends StatelessWidget {
  final Map communityData;

  CommunityDetailScreen({Key key, @required this.communityData})
      : super(key: key);

  static const routeName = '/community-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            elevation: 2.0,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                communityData['name'],
              ),
              background: Hero(
                transitionOnUserGestures: true,
                tag: communityData['name'],
                child: Image.network(
                  communityData['image'],
                  fit: BoxFit.cover,
                  color: Colors.grey.shade600.withOpacity(0.8),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    communityData['subtitle'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Divider(
                  height: 0.2,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    communityData['more_detail'],
                    style: TextStyle(fontSize: 17, height: 1.8),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => launchURL(communityData['joining_url']),
        icon: Icon(Icons.group_add),
        label: Text("Join"),
      ),
    );
  }
}
