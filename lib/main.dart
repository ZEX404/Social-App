import 'package:ecommerce_app/core/localization/changelocale.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/view/screens/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/constants/colors.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.kPrimaryColor,
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
          bodyText1: TextStyle(
            color: Colors.white.withOpacity(0.6),
            overflow: TextOverflow.ellipsis,
            fontFamily: 'Cairo',
            fontSize: 18,
          ),
        ),
      ),
      home: const Language(),
      routes: routes,
    );
  }
}
