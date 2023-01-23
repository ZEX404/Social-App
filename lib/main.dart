import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/constants/colors.dart';
import 'core/localization/changelocale.dart';
import 'core/localization/translation.dart';
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
        scaffoldBackgroundColor: AppColors.kBackground,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: AppColors.kTextColor.withOpacity(0.8),
          ),
          headline2: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            fontSize: 26,
            color: AppColors.kTextColor.withOpacity(0.8),
          ),
          bodyText1: const TextStyle(
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
