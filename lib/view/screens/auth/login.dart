import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

late double height;
late double width;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // initRootRequest();
    super.initState();
  }

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
          "Sign In",
          style: Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 20, color: AppColors.kTextColor.withOpacity(0.5)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.kBackground,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2!.copyWith(),
            ),
            Text(
              "Sign in with your email and password\nor continue with social media",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 14, color: AppColors.kTextColor.withOpacity(0.5)),
            ),
            const SizedBox(height: 40),
            TextFormField(
              style: Theme.of(context).textTheme.bodyText1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20),
                // ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                label: const Text("Email",
                    style: TextStyle(color: AppColors.kTextColor)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: const Icon(Icons.email_outlined,
                    color: AppColors.kTextColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: AppColors.kTextColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: AppColors.kTextColor.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
