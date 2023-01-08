import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/colors.dart';
import 'package:get/get.dart';

class BuyNow extends StatelessWidget {
  const BuyNow({super.key});

  @override
  Widget build(BuildContext context) {
    const shadows2 = [
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
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have a key? ".tr,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 16,
            shadows: shadows2,
          ),
        ),
        InkWell(
          onTap: () async {
            Uri url = Uri.parse("https://t.me/ZEX_X");
            await launchUrl(url, mode: LaunchMode.externalApplication);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            "Buy now".tr,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.kTextColor,
              shadows: shadows2,
            ),
          ),
        ),
      ],
    );
  }
}
