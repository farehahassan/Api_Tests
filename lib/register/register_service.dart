import 'dart:convert';

import 'package:practice/register/register_model.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Future<RegisterModel?> registerWithModel(
      String email, String password) async {
    try {
      var url = Uri.parse("https://reqres.in/api/register");
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        return RegisterModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
