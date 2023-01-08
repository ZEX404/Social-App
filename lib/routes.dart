import 'package:ecommerce_app/core/constants/routes.dart';
// import 'package:ecommerce_app/core/middleware/middleware.dart';
import 'package:ecommerce_app/view/screens/auth/login.dart';
import 'package:ecommerce_app/view/screens/language.dart';
import 'package:ecommerce_app/view/screens/onboarding.dart';
import 'package:get/get.dart';

import 'view/screens/auth/signup.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const Language(),
    // middlewares: [MiddleWare()],
  ),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),

];
