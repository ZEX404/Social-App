// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ContinueSignUpScreen extends StatelessWidget {
  final String email;
  final String password;

  const ContinueSignUpScreen(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Continue Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Email: $email'),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}
