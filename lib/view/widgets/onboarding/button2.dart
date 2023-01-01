import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/routes.dart';

class OnBoardingButton2 extends StatelessWidget {
  const OnBoardingButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAllNamed(AppRoutes.login);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        "Skip".tr,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Cairo',
        ),
      ),
    );
  }
}
