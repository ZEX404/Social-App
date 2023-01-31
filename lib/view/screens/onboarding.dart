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
import 'package:flutter/material.dart'
    show
        Animation,
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
        TextInputAction,
        TextOverflow,
        TextSpan,
        TextStyle,
        Widget,
        showGeneralDialog;
import 'package:flutter/services.dart'
    show Color, FontWeight, Offset, SystemUiOverlayStyle, TextAlign;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' show Get, Inst;
// import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart'
    show OneShotAnimation, RiveAnimation, RiveAnimationController;
import 'package:ecommerce_app/core/services/services.dart'
    show alexandria, isInternetAccess, quoteAuthor, quoteText;

import '../widgets/auth/customtextform.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

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

  checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      isInternetAccess = false;
      // print(isInternetAccess);
    } else {
      isInternetAccess = true;
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
        isInternetAccess = result.name == "none" ? false : true;
        // print(isInternetAccess);
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
                              _btnAnimationController.isActive = true;
                              showGeneralDialog(
                                barrierDismissible: true,
                                barrierLabel: "Sign In",
                                context: context,
                                pageBuilder: (BuildContext context,
                                        Animation<double> _,
                                        Animation<double> __) =>
                                    Center(
                                  child: Container(
                                    height: height / 1.28,
                                    padding: EdgeInsets.symmetric(
                                        vertical: height / 60, horizontal: 24),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 18),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Sign In",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              color: AppColors.kPrimaryColor,
                                              fontSize: height / 24,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 60),
                                            child: Text(
                                              "Welcome, Enter your details to sign in or sign up using one of the available methods.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'poppins',
                                                color: Colors.black45,
                                                fontSize: height / 65,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: height / 60),
                                            child: const SignUpForm(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
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

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: CustomTextForm(
              validator: (p0) {
                return null;
              },
              TextInputAction: TextInputAction.next,
              hintText: "Enter your Email",
              label: "Email",
              iconData: "assets/icons/email.svg",
              myController: TextEditingController(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: CustomTextForm(
              isObsecure: true,
              validator: (p0) {
                return null;
              },
              TextInputAction: TextInputAction.done,
              hintText: "Enter your Password",
              label: "Password",
              iconData: "assets/icons/password.svg",
              myController: TextEditingController(),
            ),
          ),
        ],
      ),
    );
  }
}
