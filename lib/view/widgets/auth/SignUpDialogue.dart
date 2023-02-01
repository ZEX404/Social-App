// ignore_for_file: file_names

import 'package:ecommerce_app/view/widgets/auth/sign_up_form.dart'
    show SignUpForm;
import 'package:flutter/material.dart'
    show
        Alignment,
        Animation,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Center,
        ClipRRect,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        CurvedAnimation,
        Curves,
        EdgeInsets,
        MainAxisAlignment,
        Offset,
        Padding,
        Scaffold,
        SingleChildScrollView,
        SlideTransition,
        Text,
        TextAlign,
        TextStyle,
        Tween,
        showGeneralDialog;
import '../../../core/constants/colors.dart' show AppColors;
import '../../../core/services/services.dart' show alexandria;
import '../../screens/onboarding.dart' show isSignUpDialogueShown;
import '../onboarding/slider.dart';

Future<Object?> customSignUpDialogue(BuildContext context) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign Up",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
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
                            "Fill the fields to create your account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: alexandria,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        SignUpForm(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ).then((value) {
    isSignUpDialogueShown = false;
    return null;
  });
}
