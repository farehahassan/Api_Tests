import 'dart:convert';

import 'package:http/http.dart' as http;

class PhotosServices {
  Future<List<dynamic>?> getPhotos() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
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
