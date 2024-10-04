import 'package:flutter/material.dart';

class ShowRegisterData extends StatefulWidget {
  final String email;
  final String password;
  final String token;
  final String id;

  ShowRegisterData({
    required this.email,
    required this.password,
    required this.token,
    required this.id,
  });

  @override
  _ShowRegisterDataState createState() => _ShowRegisterDataState();
}

class _ShowRegisterDataState extends State<ShowRegisterData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${widget.email}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Password: ${widget.password}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Token: ${widget.token}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('ID: ${widget.id}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
