import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/core/localization/changelocale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/onboarding/language/custombuttonlang.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            CustomButtonLang(
                text: 'العربية',
                onPressed: () {
                  controller.changeLang('ar');
                  Get.offNamed(AppRoutes.onBoarding);
                }),
            CustomButtonLang(
                text: 'English',
                onPressed: () {
                  controller.changeLang('en');
                  Get.offNamed(AppRoutes.onBoarding);
                }),
          ],
        ),
      ),
    );
  }
}
