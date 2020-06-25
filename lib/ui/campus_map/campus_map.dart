import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CampusMapScreen extends StatefulWidget {

  static final String routeName = "/campus-map";

  @override
  _CampusMapScreenState createState() => _CampusMapScreenState();
}

class _CampusMapScreenState extends State<CampusMapScreen> {

  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Map"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            onWebViewCreated: (WebViewController controller) {
              setState(() {
                _controller = controller;
              });
            },
            onPageFinished: (String url) {
 
              // Manipulating DOM to remove searchbox and FAB

              _controller.evaluateJavascript("document.querySelector('.ml-searchbox-button-parent').remove();document.querySelector('.ml-fab-inner').remove();var map = document.querySelector('.map'); map.style.transform='none'; map.style.maxHeight='100%';");
            },
            initialUrl:
                'https://www.google.com/maps/place/Shri+Shankaracharya+Group+of+Institutions+(S1),+Junwani,+Chhattisgarh+490020/@21.2148189,81.3084021,17z/data=!4m2!3m1!1s0x3a293d3d85555555:0x2d082fae1d006e97',
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
          );
        },
      ),
    );
  }
}
