import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

String getRandomFact() {
  var list = [
    'Our college has a student developer community',
    'Our college has an E-cell',
    'Our College\'s annual fest is called Samvid',
  ];
  final _random = new Random();
  String randomFact = list[_random.nextInt(list.length)];
  return randomFact;
}

