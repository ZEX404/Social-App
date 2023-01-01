import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/datasource/static/static.dart';

class OnBoardingSlider extends GetView<OnBoardingControllerImp> {
  const OnBoardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: OnBoardingList.length,
      itemBuilder: (context, i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: SizedBox()),
            Image.asset(
              OnBoardingList[i].image!,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
            const Expanded(child: SizedBox()),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(OnBoardingList[i].title!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1),
                  Text(OnBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
