import 'dart:convert';

import 'package:practice/subdata/subdata_model.dart';
import 'package:http/http.dart' as http;

class SubdataServices {
  Future<SubDataModel?> getSubDataWithModel() async {
    try {
      var url = Uri.parse("https://reqres.in/api/unknown");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        SubDataModel model = SubDataModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<dynamic>?> getSubDataWithoutModel() async {
    try {
      var url = Uri.parse("https://reqres.in/api/unknown");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
