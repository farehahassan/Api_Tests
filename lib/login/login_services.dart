import 'dart:convert';

import 'package:practice/login/login_model.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  Future<LoginModel?> loginWithModel(String email, String password) async {
    try {
      var url = Uri.parse("https://reqres.in/api/login");
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
}
