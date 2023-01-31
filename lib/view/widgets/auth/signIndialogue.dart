// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';
import '../../../core/services/services.dart';
import '../../screens/onboarding.dart';
import '../onboarding/slider.dart';
import 'sign_in_form.dart';

Future<Object?> customSignInDialogue(BuildContext context) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
    },
    pageBuilder:
        (BuildContext context, Animation<double> _, Animation<double> __) =>
            Center(
      child: Container(
        // alignment: Alignment.center,
        height: height / 1.8,
        padding: EdgeInsets.symmetric(
            vertical: height / 80, horizontal: height / 55),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: alexandria,
                      color: AppColors.kPrimaryColor,
                      fontSize: 34,
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height / 60, bottom: height / 80),
                        child: Text(
                          "Welcome, Enter your details to sign in",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: alexandria,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      const SignInForm(),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: height / 70),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.black26,
                                fontFamily: alexandria,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height / 60),
                            child: Text(
                              "Sign up with Email, Apple or Google",
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: alexandria,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/icons/email_box.svg',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/icons/apple_box.svg',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/icons/google_box.svg',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ).then((value) {
    isSignInDialogueShown = false;
    return null;
  });
}
