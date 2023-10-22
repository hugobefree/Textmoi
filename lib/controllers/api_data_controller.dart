import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:testmoi/common/api_url.dart';
import 'dart:convert' as convert;

import 'package:testmoi/utils/data/models/user.dart';

class APIDataController {
  static Future<List<User>> getApiData() async {
    final url = Uri.parse(api_url);
    try {
      final response = await http.get(url);
      final jsonResponse = convert.jsonDecode(response.body);
      var data = jsonResponse['results'];
      List<User> usersData = [];
      for (var item in data) {
        usersData.add(User.fromJson(item));
      }
      return usersData;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
