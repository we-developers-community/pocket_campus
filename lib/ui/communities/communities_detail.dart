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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Center(
              child: Hero(
                tag: communityData['name'],
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        communityData['image'],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                communityData['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                communityData['subtitle'],
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[500],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                communityData['more_detail'],
                style: TextStyle(fontSize: 17, height: 1.8),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => launchURL(communityData['joining_url']),
        icon: Icon(Icons.group_add),
        label: Text("Join"),
      ),
    );
  }
}
