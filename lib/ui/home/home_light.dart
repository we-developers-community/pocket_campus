import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './grid_details.dart';

class HomeLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        Container(
          height: mediaQuery.size.height * 0.3,
          width: mediaQuery.size.width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.indigoAccent],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkaqXbA0rN7lUU5jqZwCgKzk8vEOpdZv1FVPVEuDKoFylXpwJt&usqp=CAU',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: mediaQuery.size.height * 0.35,
          width: mediaQuery.size.width,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Consumer<GridDetails>(
            builder: (context, gridDetails, child) => GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: gridDetails.texts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (ctx, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.indigoAccent],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      gridDetails.icons[index],
                      color: Colors.white,
                    ),
                    Text(
                      '${gridDetails.texts[index]}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
