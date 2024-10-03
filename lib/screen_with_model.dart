import 'package:flutter/material.dart';
import 'package:practice/api_services.dart';
import 'package:practice/single_with_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({Key? key}) : super(key: key);

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isready = false;
  SignlePostWithModel signlePostWithModel = SignlePostWithModel();
  _getSinglePost() {
    isready = true;
    ApiServices().getSinglePostWithModel().then((value) {
      setState(() {
        signlePostWithModel = value!;
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
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenWithModel'),
      ),
      body: isready == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  signlePostWithModel.userId.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Text(
                  signlePostWithModel.title.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 8, 40, 66)),
                ),
                Text(
                  signlePostWithModel.body.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 243, 65, 33)),
                ),
              ],
            ),
    );
  }
}
