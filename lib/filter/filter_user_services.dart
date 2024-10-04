import 'dart:convert';

import 'package:practice/filter/filter_user_model.dart';
import 'package:http/http.dart' as http;

class FilterUserServices {
  Future<UsersList?> filterUserService() async {
    var url = Uri.parse("https://dummyjson.com/users");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return UsersList.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
