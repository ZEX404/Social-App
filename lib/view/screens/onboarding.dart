import 'dart:async';
import 'dart:ui' show Color, FontWeight, ImageFilter, Offset, Shadow, TextAlign;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/controller/onboardingcontroller.dart'
    show OnBoardingControllerImp;
import 'package:ecommerce_app/core/constants/colors.dart' show AppColors;
import 'package:ecommerce_app/core/constants/constants.dart' show nunito;
import 'package:ecommerce_app/view/widgets/onboarding/animatedbtn.dart'
    show AnimatedBtn;
import 'package:ecommerce_app/view/widgets/onboarding/dotcontroller.dart'
    show DotController;
import 'package:ecommerce_app/view/widgets/onboarding/slider.dart'
    show OnBoardingSlider;
import 'package:ecommerce_app/view/widgets/auth/signIndialogue.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart'
    show
        AnnotatedRegion,
        BackdropFilter,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
        Container,
        EdgeInsets,
        Expanded,
        FontWeight,
        Image,
        MainAxisAlignment,
        MediaQuery,
        Offset,
        Padding,
        Positioned,
        RichText,
        Row,
        SafeArea,
        Scaffold,
        Shadow,
        SizedBox,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextAlign,
        TextOverflow,
        TextSpan,
        TextStyle,
        Widget;
import 'package:flutter/services.dart'
    show Color, FontWeight, Offset, SystemUiOverlayStyle, TextAlign;
import 'package:get/get.dart' show Get, Inst;
// import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart'
    show OneShotAnimation, RiveAnimation, RiveAnimationController;
import 'package:ecommerce_app/core/services/services.dart'
    show alexandria, isInternetAccess, quoteAuthor, quoteText;

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

bool isSignInDialogueShown = false;
bool isSignUpDialogueShown = false;

const shadows = [
  Shadow(offset: Offset(-0.8, -0.8), color: Colors.black),
  Shadow(offset: Offset(0.8, -0.8), color: Colors.black),
  Shadow(offset: Offset(0.8, 0.8), color: Colors.black),
  Shadow(offset: Offset(-0.8, 0.8), color: Colors.black),
];

const shadows2 = [
  Shadow(offset: Offset(-0.4, -0.4), color: Colors.black),
  Shadow(offset: Offset(0.4, -0.4), color: Colors.black),
  Shadow(offset: Offset(0.4, 0.4), color: Colors.black),
  Shadow(offset: Offset(-0.4, 0.4), color: Colors.black),
];

class _OnBoardingState extends State<OnBoarding> {
  late RiveAnimationController _btnAnimationController;

  late String? appLatestVersion;
  late String? appIsMaintainence;
  late String? appIsDialogue;

  void getData() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/ZEX404/Api/main/data.txt'));
    if (response.statusCode == 200) {
      final data = response.body;
      appLatestVersion =
          RegExp(r'【varsion】(.*?)【varsion】').firstMatch(data)?.group(1);
      appIsMaintainence =
          RegExp(r'【maintain】(.*?)【maintain】').firstMatch(data)?.group(1);
      appIsDialogue =
          RegExp(r'【dialoge】(.*?)【dialoge】').firstMatch(data)?.group(1);
      // print('version = $appLatestVersion');
      // print('maintain = $appIsMaintainence');
      // print('dialogue = $appIsDialogue');
    } else {
      // print('error , statusCode = $response.statusCode');
    }
  }

  checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      isInternetAccess = false;
      // print(isInternetAccess);
    } else {
      isInternetAccess = true;
      // getData();
      // print(isInternetAccess);
    }
  }

  late StreamSubscription<ConnectivityResult> checkConnection;
  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    checkInternetConnection();
    checkConnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      setState(() {
        if (result.name != "none") {
          isInternetAccess = true;
          getData();
        } else {
          isInternetAccess = false;
        }
      });
    });

    super.initState();
  }

  @override
  dispose() {
    super.dispose();

    checkConnection.cancel();
  }

  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.kBackground,
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                          children: const [
                            Text(
                              "Social App",
                              style: TextStyle(
                                fontSize: 26,
                                color: AppColors.kTextColor,
                                fontFamily: nunito,
                                fontWeight: FontWeight.bold,
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
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    quoteText == ""
                                        ? const SizedBox.shrink()
                                        : Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: RichText(
                                              textAlign: TextAlign.center,
                                              maxLines: 6,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                text: '“',
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  fontFamily: alexandria,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: quoteText,
                                                    style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 82, 79, 79),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      fontFamily: alexandria,
                                                    ),
                                                  ),
                                                  const TextSpan(
                                                    text: '”',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.green,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
                                      child: Text(
                                        quoteAuthor,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 10,
                                          fontFamily: alexandria,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // const Spacer(),
                          AnimatedBtn(
                            btnAnimationController: _btnAnimationController,
                            press: () {
                              if (isSignInDialogueShown == false) {
                                _btnAnimationController.isActive = true;
                                setState(() {
                                  isSignInDialogueShown = true;
                                });
                                Future.delayed(
                                  const Duration(milliseconds: 760),
                                  () {
                                    customSignInDialogue(context);
                                  },
                                );
                              }
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
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14,
                                      fontFamily: alexandria,
                                    ),
                                  ),
                                  Text(
                                    "ZEX99",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 26,
                                      fontFamily: alexandria,
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
