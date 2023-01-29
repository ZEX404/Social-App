// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/class/crud.dart';
import '../../../core/constants/apilinks.dart';
import '../../../core/constants/routes.dart';
import '../../../main.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class JoinScreen extends StatelessWidget {
  JoinScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Crud crud = Crud();

  Future<String?> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      var response = await crud.postRequest(loginLink, {
        "email": data.name,
        "password": data.password,
      });

      if (response['status'] == 'success') {
        sharedPref.setString("email", data.name);
        sharedPref.setString("password", data.password);
      } else {
        return (response['message']);
      }

      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      hideForgotPasswordButton: true,
      scrollable: true,
      theme: LoginTheme(
        inputTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.kTextColor,
            ),
          ),
          activeIndicatorBorder: const BorderSide(
            color: AppColors.kTextColor,
          ),
          iconColor: AppColors.kTextColor,
          prefixIconColor: AppColors.kTextColor,
          suffixIconColor: AppColors.kTextColor,
          labelStyle: GoogleFonts.cairo(
            color: AppColors.kTextColor,
          ),
          hintStyle: GoogleFonts.cabin(
            color: AppColors.kTextColor,
          ),
        ),
        accentColor: Colors.transparent,
        footerBackgroundColor: Colors.purple,
        switchAuthTextColor: AppColors.kTextColor,
        bodyStyle: GoogleFonts.roboto(
          color: AppColors.kTextColor,
        ),
        cardTheme: const CardTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        buttonTheme:
            const LoginButtonTheme(backgroundColor: AppColors.kPrimaryColor),
        buttonStyle: GoogleFonts.roboto(
          color: AppColors.kBackground,
        ),
        primaryColor: AppColors.kBackground,
        pageColorDark: AppColors.kPrimaryColor,
        // pageColorLight: AppColors.kBackground,
        textFieldStyle: GoogleFonts.cairo(
          color: AppColors.kTextColor,
        ),
        titleStyle: GoogleFonts.nunito(
          color: AppColors.kTextColor,
          fontSize: 22,
        ),
      ),
      title: 'Social App',
      logo: const AssetImage('assets/images/icon.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Get.offAllNamed(AppRoutes.home);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
