import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class MiddleWare extends GetMiddleware {
  // ignore: non_constant_identifier_names
  int? get Priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
