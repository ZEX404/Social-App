import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingButton1 extends GetView<OnBoardingControllerImp> {
  const OnBoardingButton1({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.next();
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
      child:  Text(
        // controller.currentPage == OnBoardingList.length - 1
        //     ? 'Continue'
        //     :
        'Next'.tr,
        style: const TextStyle(
          color: Color(0xffffc032),
          fontSize: 20,
          fontFamily: 'Cairo',
        ),
      ),
    );
  }
}
