import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:ecommerce_app/view/widgets/onboarding/button2.dart';
import 'package:ecommerce_app/view/widgets/onboarding/dotcontroller.dart';
import 'package:ecommerce_app/view/widgets/onboarding/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/onboarding/button1.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 6,
              child: OnBoardingSlider(),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    OnBoardingButton2(),
                    DotController(),
                    OnBoardingButton1(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
