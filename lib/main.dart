import 'package:flutter/material.dart';
import 'package:practice/createjob/job_screen.dart';
import 'package:practice/login/login_screen.dart';
import 'package:practice/multiple%20posts/multi_post_without_model.dart';
import 'package:practice/multiple%20posts/multi_posts_with_model.dart';
import 'package:practice/photos/photos_screen.dart';
import 'package:practice/screen_with_model.dart';
import 'package:practice/screen_without_model.dart';
import 'package:practice/subdata/subdata_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: JobScreen(),
    );
  }
}
