import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io'; // Needed for catching SocketException
import 'package:practice/multiple%20posts/multi_model.dart';

class MultiPostServices {
  Future<List<MultiPostWithModel>?> getMultiPostWithModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<MultiPostWithModel> model = List<MultiPostWithModel>.from(
            jsonDecode(response.body)
                .map((x) => MultiPostWithModel.fromJson(x)));
        return model;
      } else {
        print("Server error with status code: ${response.statusCode}");
      }
    } on SocketException {
      print('No Internet connection.');
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<List<dynamic>?> getMultiPostWithoutModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
