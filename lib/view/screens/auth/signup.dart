import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

late double height;
late double width;

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    const shadows2 = [
      Shadow(offset: Offset(-0.5, -0.5), color: Colors.black),
      Shadow(offset: Offset(0.5, -0.5), color: Colors.black),
      Shadow(offset: Offset(0.5, 0.5), color: Colors.black),
      Shadow(offset: Offset(-0.5, 0.5), color: Colors.black),
    ];
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.kBackground,
      ),
      body: Container(),
    );
  }
}
