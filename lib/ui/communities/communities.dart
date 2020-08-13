import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommunityDetail {
  String id;
  String title;
  String description;
  String url;
  String website;
  List<Map<String, int>> volunteers;

  CommunityDetail(
      {this.id,
      this.title,
      this.description,
      this.url,
      this.website,
      this.volunteers});
}

class CommunityList with ChangeNotifier {
  List<CommunityDetail> _communityList = [];

  List<CommunityDetail> get communityList {
    return _communityList;
  }

  CommunityDetail findById(id) {
    final community = _communityList.firstWhere((element) => element.id == id);
    // if (community.toString().isEmpty) {
    //   return CommunityDetail(
    //       id: 'none',
    //       description:
    //           'unable to load the community. Please try after some time');
    // } else
    //   return community;
    return community;
  }

  Future<void> getCommunities() async {
    const url = 'https://pocket-campus-48751.firebaseio.com/Communities.json';

    try {
      final res = await http.get(url);
      final resData = json.decode(res.body) as Map<String, dynamic>;
      resData.forEach(
        (key, value) {
          _communityList.add(
            CommunityDetail(
              id: key,
              title: value['title'],
              description: value['description'],
              website: value['website'],
              url: value['imgUrl'],
            ),
          );
        },
      );
      notifyListeners();
    } catch (error) {
      print(error);
      throw(error);
    }
  }
}
