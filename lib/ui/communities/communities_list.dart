import 'package:flutter/material.dart';
import 'package:pocket_college/ui/communities/communities_detail.dart';
import 'package:provider/provider.dart';

import './communities.dart';

class CommunityListScreen extends StatefulWidget {
  static const routeName = '/communities';

  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<CommunityListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CommunityList>(context,listen: false).getCommunities();
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    List communities = Provider.of<CommunityList>(context).communityList;

    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.event),
        title: Text('Communities'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: communities.length,
          itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  CommunitiesDetailScreen.routeName,
                  arguments: communities[index].id,
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: mediaQuery.size.height * 0.20,
                      width: mediaQuery.size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: communities[index].id,
                          child: Image.network(
                            '${communities[index].url}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(16),
                        ),
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                      child: Text(
                        '${communities[index].title}',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
