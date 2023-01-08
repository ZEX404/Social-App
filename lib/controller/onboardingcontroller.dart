import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constants/routes.dart';
import '../core/services/services.dart';
import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > OnBoardingList.length - 1) {
      myServices.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
