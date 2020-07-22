import 'package:flutter/material.dart';
import 'package:pocket_college/ui/communities/communities_detail.dart';
import 'package:pocket_college/helpers.dart';

List<Map> communitiesData = [
  {
    'name': 'Developers Community',
    'image': "https://envri.eu/wp-content/uploads/2016/08/software-developer-copy.jpg",
    'subtitle': 'A community for developers',
    'joining_url': 'https://example.com',
    'more_detail':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat risus nulla, sed luctus augue auctor nec. In sagittis blandit arcu in volutpat. Quisque tortor justo, vulputate et felis ut, vestibulum posuere ex. Proin semper mauris vel urna elementum convallis., Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat risus nulla, sed luctus augue auctor nec. In sagittis blandit arcu in volutpat. Quisque tortor justo, vulputate et felis ut, vestibulum posuere ex. Proin semper mauris vel urna elementum convallis.',
  },
  {
    'name': 'IEEE',
    'image': "https://via.placeholder.com/300",
    'subtitle': 'One step further',
    'joining_url': 'https://example.com',
    'more_detail':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce volutpat risus nulla, sed luctus augue auctor nec. In sagittis blandit arcu in volutpat. Quisque tortor justo, vulputate et felis ut, vestibulum posuere ex. Proin semper mauris vel urna elementum convallis.',
  },
];

Widget getCommunityListElementWidget(
  Map communityData,
  BuildContext context,
) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: <Widget>[
        Hero(
          transitionOnUserGestures: true,
          tag: communityData['name'],
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image(
                image: NetworkImage(
                  communityData['image'],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(15, 10, 0, 0),
          title: Text(
            communityData['name'],
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              communityData['subtitle'],
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CommunityDetailScreen(communityData: communityData),
                  ),
                );
              },
              icon: Icon(
                Icons.info_outline,
                color: Theme.of(context).accentColor,
              ),
              label: Text(
                "About",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            RaisedButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: () => launchURL(communityData['joining_url']),
              icon: Icon(Icons.group_add),
              label: Text("Join"),
            ),
          ],
        ),
      ],
    ),
  );
}

List<Widget> generateCommunitiesList(
    List<Map> communitiesData, BuildContext context) {
  List<Widget> communityWidgetsList = [];

  for (var communityData in communitiesData) {
    Widget communityListElement =
        getCommunityListElementWidget(communityData, context);

    communityWidgetsList.add(communityListElement);
    communityWidgetsList.add(
      SizedBox(
        height: 10,
      ),
    );
  }

  return communityWidgetsList;
}

class CommunityListScreen extends StatelessWidget {
  static const routeName = '/community-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Communities"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              ...generateCommunitiesList(communitiesData, context),
            ],
          ),
        ),
      ),
    );
  }
}
