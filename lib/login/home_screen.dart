// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String? name;
  String? id;
  String? job;
  String? created;
  String? token;
  HomeScreen({
    Key? key,
    this.name,
    this.id,
    this.job,
    this.created,
    this.token,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            id ?? "",
            textScaler: TextScaler.linear(2),
          ),
          Text(
            name ?? "",
            // textScaler: TextScaler.linear(2),
          ),
          Text(
            job ?? "",
            // textScaler: TextScaler.linear(2),
          ),
          Text(
            created ?? "",
            // textScaler: TextScaler.linear(2),
          ),
        ],
      ),
    );
  }
}
