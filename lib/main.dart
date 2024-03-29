import 'dart:io';
import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/constants/colors.dart';
import 'core/localization/changelocale.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  sharedPref = await SharedPreferences.getInstance();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'IStudy',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.kBackground,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: AppColors.kTextColor.withOpacity(0.8),
            fontFamily: nunito,
          ),
          displayMedium: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
              color: AppColors.kTextColor.withOpacity(0.8),
              fontFamily: nunito),
          bodyLarge: const TextStyle(
            color: AppColors.kTextColor,
            fontFamily: nunito,
            fontSize: 18,
          ),
        ),
      ),
      getPages: routes,
    );
  }
}
