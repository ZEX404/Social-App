import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late double height;
late double width;

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 12,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              hoverColor: Colors.red[200],
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.telegram, color: AppColors.kTextColor),
                    const SizedBox(width: 5),
                    Text(
                      'Telegram'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              hoverColor: Colors.red[200],
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/internet.png',
                        height: 25, color: AppColors.kTextColor),
                    const SizedBox(width: 5),
                    Text(
                      'Website'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
