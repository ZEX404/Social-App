import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'package:get/get.dart';

class BuyNow extends StatelessWidget {
  const BuyNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account ? ".tr,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 16,
            shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-0.5, -0.5),
                  color: Colors.black),
              Shadow(
                  // bottomRight
                  offset: Offset(0.5, -0.5),
                  color: Colors.black),
              Shadow(
                  // topRight
                  offset: Offset(0.5, 0.5),
                  color: Colors.black),
              Shadow(
                  // topLeft
                  offset: Offset(-0.5, 0.5),
                  color: Colors.black),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            "Buy now".tr,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.kTextColor,
              shadows: [
                Shadow(
                    // bottomLeft
                    offset: Offset(-0.5, -0.5),
                    color: Colors.black),
                Shadow(
                    // bottomRight
                    offset: Offset(0.5, -0.5),
                    color: Colors.black),
                Shadow(
                    // topRight
                    offset: Offset(0.5, 0.5),
                    color: Colors.black),
                Shadow(
                    // topLeft
                    offset: Offset(-0.5, 0.5),
                    color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
