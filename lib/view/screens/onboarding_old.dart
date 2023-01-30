// ignore_for_file: camel_case_types

import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/onboardingcontroller.dart';
import '../widgets/onboarding/dotcontroller.dart';
import '../widgets/onboarding/slider.dart';

late double height;
late double width;

const shadows2 = [
  Shadow(offset: Offset(-0.2, -0.2), color: Colors.black),
  Shadow(offset: Offset(0.2, -0.2), color: Colors.black),
  Shadow(offset: Offset(0.2, 0.2), color: Colors.black),
  Shadow(offset: Offset(-0.2, 0.2), color: Colors.black),
];

class OnBoarding_old extends StatelessWidget {
  const OnBoarding_old({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: OnBoardingSlider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  DotController(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Divider(
                color: AppColors.kTextColor.withOpacity(0.2),
                thickness: 1,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              height: height / 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color: AppColors.kTextColor)))),
                    onPressed: () {
                      Get.toNamed(AppRoutes.signUp);
                      // Get.toNamed(AppRoutes.join);
                    },
                    child: SizedBox(
                      width: width / 1.5,
                      child: Text(
                        "CREATE AN ACCOUNT",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          letterSpacing: 1.5,
                          fontSize: 14,
                          color: AppColors.kTextColor,
                          shadows: shadows2,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Text(
                      "I ALREADY HAVE AN ACCOUNT",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        letterSpacing: 1.5,
                        fontSize: 14,
                        color: AppColors.kTextColor,
                        shadows: shadows2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}