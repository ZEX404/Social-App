import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  bool isObscure = true;

  showPassword() {
    isObscure = isObscure == true ? isObscure = false : true;
    update();
  }

  @override
  login() {}

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
