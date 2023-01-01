import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/view/screens/auth/login.dart';
import 'package:ecommerce_app/view/screens/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (p0) => const Login(),
  AppRoutes.onBoarding: (p0) => const OnBoarding(),
};
