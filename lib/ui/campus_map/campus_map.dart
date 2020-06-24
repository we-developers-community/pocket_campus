import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CampusMapScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Map"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: 'https://www.google.com/maps/place/Shri+Shankaracharya+Group+of+Institutions+(S1)/@21.2161967,81.3055806,17z/data=!4m12!1m6!3m5!1s0x3a293d3d85555555:0x2d082fae1d006e97!2sShri+Shankaracharya+Group+of+Institutions+(S1)!8m2!3d21.2161917!4d81.3077693!3m4!1s0x3a293d3d85555555:0x2d082fae1d006e97!8m2!3d21.2161917!4d81.3077693',
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
          );
        },
      ),
    );
  }
}
