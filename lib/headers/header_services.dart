import 'dart:convert';
// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/createjob/job_screen.dart';
// import 'package:practice/headers/header_model.dart';

class HeaderServices {
  Future<dynamic> getUserDetails(BuildContext context) async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTcyODAyMjA5NiwiZXhwIjoxNzI5NzUwMDk2fQ.XTrRfDFOyvGeRgrJ3iY2RrGJ4U5H4z2YwoQ_dUfRYXY';
    var url = Uri.parse("https://api.escuelajs.co/api/v1/auth/profile");

    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('statusCode :  ${response.statusCode.toString()}');
      Navigator.push(context, CupertinoPageRoute(builder: (_) => JobScreen()));
      return null;
    }
  }
}
