import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:ecommerce_app/controller/onboardingcontroller.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/view/widgets/onboarding/animatedbtn.dart';
import 'package:ecommerce_app/view/widgets/onboarding/dotcontroller.dart';
import 'package:ecommerce_app/view/widgets/onboarding/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

late String author;
late String text;

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

const shadows = [
  Shadow(offset: Offset(-0.2, -0.2), color: Colors.black),
  Shadow(offset: Offset(0.2, -0.2), color: Colors.black),
  Shadow(offset: Offset(0.2, 0.2), color: Colors.black),
  Shadow(offset: Offset(-0.2, 0.2), color: Colors.black),
];

Future<void> getData() async {
  final response = await http.get(
    Uri.parse('https://type.fit/api/quotes'),
  );

  if (response.statusCode == 200) {
    int mapLength = (jsonDecode(response.body).length) - 1;
    Random rnd = Random();
    int randomQuote = rnd.nextInt(mapLength);
    dynamic quote = jsonDecode(response.body)[randomQuote];
    author = quote['author'];
    text = quote['text'];
    print("[$randomQuote]\n$author : $text");
  } else {
    print('Failed to fetch data');
  }
}

class _OnBoardingState extends State<OnBoarding> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.kBackground,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                width: MediaQuery.of(context).size.width * 1.7,
                bottom: 200,
                left: 100,
                child: Image.asset('assets/Backgrounds/Spline.png'),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20,
                    sigmaY: 10,
                  ),
                  // child: SizedBox(),
                ),
              ),
              const RiveAnimation.asset('assets/animations/shapes.riv'),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 30,
                    sigmaY: 30,
                  ),
                  child: const SizedBox(),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Social App",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: 26,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const OnBoardingSlider(),
                      const SizedBox(height: 8),
                      const SizedBox(
                        height: 20,
                        child: DotController(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          AnimatedBtn(
                            btnAnimationController: _btnAnimationController,
                            press: () {
                              _btnAnimationController.isActive = true;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Center(
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "From",
                                    style: GoogleFonts.alexandria(
                                      color: Colors.black38,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "ZEX99",
                                    style: GoogleFonts.alexandria(
                                      color: Colors.indigo,
                                      fontSize: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
