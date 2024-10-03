import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice/single_with_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //with model

  Future<SignlePostWithModel?> getSinglePostWithModel() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        SignlePostWithModel model =
            SignlePostWithModel.fromJson(jsonDecode(response.body));

        return model;
      }
    } catch (e) {
      print(e);
    }
  }

  // without model

  Future<dynamic> getSinglePostWithoutmodel() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;
        final data = jsonDecode(body);
        return data;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
