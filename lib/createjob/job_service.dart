import 'dart:convert';

import 'package:practice/createjob/job_model.dart';
import 'package:http/http.dart' as http;

class JobService {
  Future<JobModel?> createJob(String name, String job) async {
    try {
      var url = Uri.parse("https://reqres.in/api/users");
      var response = await http.post(url, body: {
        "name": name,
        "job": job,
      });
      if (response.statusCode == 201) {
        return JobModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
}
