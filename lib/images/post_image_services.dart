import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostImageServices {
  Future<dynamic> uploadImage(
      Uint8List bytes, String fileName, BuildContext context) async {
    var url = Uri.parse("https://api.escuelajs.co/api/v1/files/upload");
    var request = await http.MultipartRequest('POST', url);
    var multiPartFile = http.MultipartFile(
      'file',
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: fileName,
    );
    request.files.add(multiPartFile);
    final response = await request.send();
    if (response.statusCode == 201) {
      return response.stream.bytesToString();
    } else {
// Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading image: ${response.statusCode}'),
          backgroundColor: Colors.red,
        ),
      );

      return null;
    }
  }
}
