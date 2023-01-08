import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboardingcontroller.dart';
import '../widgets/onboarding/dotcontroller.dart';
import '../widgets/onboarding/slider.dart';

late double height;
late double width;

const shadows2 = [
  Shadow(offset: Offset(-0.5, -0.5), color: Colors.black),
  Shadow(offset: Offset(0.5, -0.5), color: Colors.black),
  Shadow(offset: Offset(0.5, 0.5), color: Colors.black),
  Shadow(offset: Offset(-0.5, 0.5), color: Colors.black),
];

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
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
                  // OnBoardingButton2(),
                  DotController(),
                  // OnBoardingButton1(),
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
                    onPressed: () {},
                    child: SizedBox(
                      width: width / 1.5,
                      child: const Text(
                        "CREATE AN ACCOUNT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          letterSpacing: 2,
                          fontSize: 14,
                          color: AppColors.kTextColor,
                          fontFamily: 'cairo',
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
                    onPressed: () {},
                    child: const Text(
                      "I ALREADY HAVE AN ACCOUNT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 2,
                        fontSize: 14,
                        color: AppColors.kTextColor,
                        fontFamily: 'cairo',
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
