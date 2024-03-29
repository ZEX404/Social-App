import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/view/screens/home/home.dart';
import 'package:ecommerce_app/view/screens/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () {
      if (sharedPref.getString("email") == null) {
        return const OnBoarding();
      } else {
        return const HomeScreen();
      }
    },
    // middlewares: [MiddleWare()],
  ),
  // GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  // GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
];
