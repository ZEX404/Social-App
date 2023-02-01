// ignore_for_file: file_names

import 'package:ecommerce_app/view/widgets/auth/SignUpDialogue.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/services/services.dart';
import '../../screens/onboarding.dart';
import '../onboarding/slider.dart';
import 'sign_in_form.dart';

bool isShowLoading = false;

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
                            "Sign in to your account and continue exploring all the features and benefits",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: alexandria,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        const SignInForm(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height / 70),
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
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //     customSignUpDialogue(context);
                        //     isSignUpDialogueShown = true;
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     minimumSize: const Size(double.infinity, 45),
                        //     backgroundColor:
                        //         const Color.fromARGB(255, 100, 226, 100),
                        //     shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.only(
                        //         bottomLeft: Radius.circular(25),
                        //         bottomRight: Radius.circular(25),
                        //         topLeft: Radius.circular(10),
                        //         topRight: Radius.circular(25),
                        //       ),
                        //     ),
                        //   ),
                        //   child: Text(
                        //     "Create new account",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 18,
                        //       fontFamily: alexandria,
                        //     ),
                        //   ),
                        // ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            customSignUpDialogue(context);
                            isSignUpDialogueShown = true;
                          },
                          child: Text(
                            "Create new account",
                            style: TextStyle(
                              color: AppColors.kTextColor,
                              fontSize: 18,
                              fontFamily: alexandria,
                            ),
                          ),
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
    ),
  ).then((value) {
    isSignInDialogueShown = false;
    if (isShowLoading) {
      isShowLoading = false;
    }
    return null;
  });
}
