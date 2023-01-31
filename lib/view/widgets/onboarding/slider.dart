import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/static/static.dart';

late double height;
late double width;

const shadows = [
  Shadow(offset: Offset(-0.3, -0.3), color: AppColors.kTextColor),
  Shadow(offset: Offset(0.3, -0.3), color: AppColors.kTextColor),
  Shadow(offset: Offset(0.3, 0.3), color: AppColors.kTextColor),
  Shadow(offset: Offset(-0.3, 0.3), color: AppColors.kTextColor),
];

class OnBoardingSlider extends GetView<OnBoardingControllerImp> {
  const OnBoardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
      itemCount: OnBoardingList.length,
      options: CarouselOptions(
        height: height / 3,
        onPageChanged: (index, reason) {
          controller.onPageChanged(index);
        },
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, i, realIndex) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor.withOpacity(0.4),
                    border: Border.all(
                      color: AppColors.kBackground.withOpacity(0.6),
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: isInternetAccess == true
                      ? CachedNetworkImage(
                          height: height / 4,
                          imageUrl: OnBoardingList[i].image!,
                          fit: BoxFit.fitHeight,
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                flex: 5,
                                child: SizedBox(),
                              ),
                              const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Text(
                                "Waiting for network...",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: alexandria,
                                ),
                              ),
                              const Expanded(
                                flex: 5,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.kBackground.withOpacity(0.4),
                    border: Border.all(
                      color: AppColors.kBackground.withOpacity(0.6),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        OnBoardingList[i].title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: nunito,
                          shadows: shadows,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
