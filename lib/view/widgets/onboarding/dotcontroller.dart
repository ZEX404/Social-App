import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../data/datasource/static/static.dart';

class DotController extends GetView<OnBoardingControllerImp> {
  const DotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            OnBoardingList.length,
            // ignore: non_constant_identifier_names
            (Index) => GestureDetector(
              // onTap: () {
              //   controller.onPageChanged(Index - 1);
              //   controller.next();
              // },
              child: AnimatedContainer(
                margin: const EdgeInsets.all(3),
                duration: const Duration(
                  milliseconds: 500,
                ),
                height: controller.currentPage == Index ? 12 : 10,
                width: controller.currentPage == Index ? 12 : 10,
                decoration: BoxDecoration(
                    color: controller.currentPage == Index
                        ? AppColors.kTextColor
                        : Colors.black26,
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
