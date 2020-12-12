import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookings_africa/models/user_info.dart';

Future<List<UserInfo>> getUserInfo() async {
  final String apiUrl = 'https://reqres.in/api/users';
  var data = await http.get(apiUrl, headers: {"Accept": "application/json"});

  if (data.statusCode == 200) {
    final jsonData = json.decode(data.body);

    List<UserInfo> userInfo = [];
    Iterable<dynamic> list = jsonData["data"];

    for (var u in list) {
      UserInfo user = UserInfo(
          id: u["id"],
          email: u["email"],
          firstName: u["first_name"],
          lastName: u["last_name"],
          avatar: u["avatar"]);
      userInfo.add(user);
    }
    print(userInfo.length);
    return userInfo;
  } else {
    throw Exception('Failed to Load UserInfo');
  }
}
