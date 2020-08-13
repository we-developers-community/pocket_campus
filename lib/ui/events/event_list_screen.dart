import 'package:flutter/material.dart';
import 'package:pocket_college/ui/events/event_detail_screen.dart';
import 'package:provider/provider.dart';

import './events.dart';

class EventListScreen extends StatefulWidget {
  static const routeName = '/events';

  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<EventList>(context,listen: false).getEvents();
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    List events = Provider.of<EventList>(context).eventList;

    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.event),
        title: Text('Events'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  EventDetailScreen.routeName,
                  arguments: events[index].id,
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
                          tag: events[index].id,
                          child: Image.network(
                            '${events[index].url}',
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
                        '${events[index].title}',
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
