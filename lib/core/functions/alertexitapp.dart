import 'dart:io';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      backgroundColor: AppColors.kPrimaryColor.withOpacity(0.5),
      barrierDismissible: false,
      title: 'Note'.tr,
      titleStyle: const TextStyle(
        color: Colors.red,
        fontFamily: 'Cairo',
      ),
      middleText: 'Do you really want to exit?'.tr,
      middleTextStyle: TextStyle(
        fontFamily: 'Cairo'.tr,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  overlayColor: MaterialStateProperty.all(Colors.transparent)),
              child: Text(
                'Cancel'.tr,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.green,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              style: ButtonStyle(
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'Exit'.tr,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          ],
        ),
      ]);

  return Future.value(true);
}
