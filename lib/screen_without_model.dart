import 'package:flutter/material.dart';
import 'package:practice/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  bool isready = false;
  dynamic singlePost;
  _getPostWithoutModel() {
    isready = true;
    ApiServices().getSinglePostWithoutmodel().then((value) {
      setState(() {
        singlePost = value;
        isready = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isready = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getPostWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: isready
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    singlePost['userId'].toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Text(
                    singlePost['title'].toString(),
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 8, 40, 66)),
                  ),
                  Text(
                    singlePost['body'].toString(),
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 8, 40, 66)),
                  ),
                ],
              ));
  }
}
