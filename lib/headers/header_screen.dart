import 'package:flutter/material.dart';
import 'package:practice/headers/header_services.dart';

class HeaderScreen extends StatefulWidget {
  const HeaderScreen({super.key});

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {
  dynamic userDetails;
  bool isready = false;
  getUserDetails() {
    setState(() {
      isready = true;
    });
    HeaderServices().getUserDetails(context).then((value) {
      setState(() {
        userDetails = value!;
        print(value.toString());
        isready = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      isready = false;
    });
  }

  @override
  void initState() {
    getUserDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isready == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(userDetails['avatar'].toString()),
                ),
                Text(
                  userDetails['name'].toString(),
                  textScaleFactor: 2,
                ),
              ],
            ),
    );
  }
}
