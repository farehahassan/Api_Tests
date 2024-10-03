import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/login/home_screen.dart';
import 'package:practice/login/login_model.dart';
import 'package:practice/login/login_services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Key to validate the form
  final _formKey = GlobalKey<FormState>();

  // Controllers to capture user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginModel loginModel = LoginModel();

  // Method to validate and submit form
  void _submit() {
    if (_formKey.currentState!.validate()) {
      LoginServices()
          .loginWithModel(
        _emailController.text.toString(),
        _passwordController.text.toString(),
      )
          .then((value) {
        setState(() {
          loginModel = value!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logging in...')),
          );

          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => HomeScreen(
                        token: loginModel.token.toString(),
                      )));
        });
      }).onError((error, stackTrace) {
        print(error);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('invalid values ...')),
        );
      });

      // Do login process (API call or logic)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Login Button
              ElevatedButton(
                onPressed: _submit,
                child: Text('Login'),
              ),
            ],
          ),
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
