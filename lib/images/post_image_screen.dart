import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/images/post_image_services.dart';

class PostImageScreen extends StatefulWidget {
  const PostImageScreen({super.key});

  @override
  State<PostImageScreen> createState() => _PostImageScreenState();
}

class _PostImageScreenState extends State<PostImageScreen> {
  String? uploadedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload and Display Image"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          uploadedImage == null
              ? Container(
                  color: Colors.black,
                  width: 300,
                  height: 300,
                  child: Center(
                    child: Text(
                      "No image uploaded",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(uploadedImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);

              if (image != null) {
                Uint8List bytes = await image.readAsBytes();

                try {
                  // Upload image and get the full response
                  final Map<String, dynamic> response =
                      await PostImageServices()
                          .uploadImage(bytes, image.name, context);

                  // Print the entire response
                  print("Full API Response: $response");

                  // Print individual values
                  print("Original Name: ${response['originalname']}");
                  print("File Name: ${response['filename']}");
                  print("Image Location: ${response['location']}");

                  // Set the uploaded image location to display it in the UI
                  setState(() {
                    uploadedImage = response['location'] as String?;
                  });

                  // Print uploaded image location for verification
                  print("Uploaded Image URL: $uploadedImage");
                } catch (error) {
                  print("Error uploading image: $error");
                }
              }
            },
            child: Text("Upload Image"),
          ),
        ],
      ),
    );
  }
}
