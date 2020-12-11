import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bookings_africa/models/user_info.dart';
import 'package:http/http.dart' as http;

class Api {
  List userInfo;

  //Get userinfo request
  Future<List> getUserInfo() async {
    final response = await http.get(
      'https://reqres.in/api/users',
      headers: {
        HttpHeaders.authorizationHeader: 'Content-type: application/json'
      },
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      Iterable<dynamic> list = jsonData["data"];
      userInfo = list.map((items) => UserInfo.fromJson(items)).toList();
      return userInfo;
    }
  }
}
