import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/view/screens/auth/custombuttonauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late double height;
late double width;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    // initRootRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
            //   //Keyboard is visible.
            //   print("Keyboard is visible.");
            //   // dismiss the keyboeard window ?
            //   FocusManager.instance.primaryFocus?.unfocus();
            //   FocusScope.of(context).unfocus();
            // } else {
            //   //Keyboard is not visible.
            //   print("Keyboard is not visible.");
            // }
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.kPrimaryColor,
          ),
        ),
        title: Text(
          "Sign Up",
          style: Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 20, color: AppColors.kTextColor.withOpacity(0.5)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.kBackground,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            Image.asset('assets/images/icon.png',
                height: 180, fit: BoxFit.fitHeight),
            Text(
              "Hi there!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2!.copyWith(),
            ),
            Text(
              "Sign up with your email and password\nor continue with social media",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 14, color: AppColors.kTextColor.withOpacity(0.5)),
            ),
            const SizedBox(height: 40),
            const CustomTextForm(
              TextInputAction: TextInputAction.next,
              hintText: "Enter your Email",
              label: "Email",
              iconData: Icons.email_outlined,
              // myController: ,
            ),
            const SizedBox(height: 20),
            const CustomTextForm(
              TextInputAction: TextInputAction.done,
              hintText: "Enter your Password",
              label: "Password",
              iconData: Icons.lock_outlined,
              // myController: ,
            ),
            const SizedBox(height: 10),
            CustomButtonAuth(
              text: "Sign Up",
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    // Get.toNamed(AppRoutes.login);
                    Get.back();
                  },
                  child: Text(
                    "Login now",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
