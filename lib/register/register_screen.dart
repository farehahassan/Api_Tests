import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/register/register_model.dart';
import 'package:practice/register/register_service.dart';
import 'package:practice/register/show_register_data.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterModel registerModel = RegisterModel();
  bool isready = false;

  void _register() {
    setState(() {
      isready = true;
    });
    RegisterService()
        .registerWithModel(_emailController.text.toString(),
            _passwordController.text.toString())
        .then((value) {
      setState(() {
        registerModel = value!;
        isready = false;
      });
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (_) => ShowRegisterData(
                  email: _emailController.text.toString(),
                  password: _passwordController.text.toString(),
                  token: registerModel.token.toString(),
                  id: registerModel.id.toString())));
      print(registerModel.token);
    }).onError((error, stackTrace) {
      print(error);
      isready = false;
    });
    final email = _emailController.text;
    final password = _passwordController.text;

    // Add your registration logic here
    print('Email: $email, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: isready == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _register,
                    child: Text('Register'),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
