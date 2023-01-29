import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/datasource/static/static.dart';

late double height;
late double width;

class OnBoardingSlider extends GetView<OnBoardingControllerImp> {
  const OnBoardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CarouselSlider.builder(
        itemCount: OnBoardingList.length,
        options: CarouselOptions(
          height: height,
          onPageChanged: (index, reason) {
            controller.onPageChanged(index);
          },
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, i, realIndex) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: height / 2.5,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CachedNetworkImage(
                  imageUrl: OnBoardingList[i].image!,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    OnBoardingList[i].title!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoKufiArabic(
                      color: AppColors.kTextColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
