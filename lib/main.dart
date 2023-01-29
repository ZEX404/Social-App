import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
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

  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.kBackground,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: AppColors.kTextColor.withOpacity(0.8),
          ),
          displayMedium: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            fontSize: 26,
            color: AppColors.kTextColor.withOpacity(0.8),
          ),
          bodyLarge: const TextStyle(
            color: AppColors.kTextColor,
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Cairo',
            fontSize: 18,
          ),
        ),
      ),
      getPages: routes,
    );
  }
}
