  import 'dart:convert';

import 'package:testmoi/common/models/model.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> requette() async {
    print('requette est appele');
    const url = 'https://randomuser.me/api/?results=150';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    List<UserModel> users = [];
    if (response.statusCode == 200) {
      var body = response.body;
      var json = jsonDecode(body);
      print(json['results']);
      for (var e in json['results']) {
        users.add(UserModel.fromJson(e));
      }
      return users;
    } else {
      return [];
    }
  }