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
        height: height / 1.28,
        padding: EdgeInsets.symmetric(
            vertical: height / 60, horizontal: height / 55),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height / 40),
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: alexandria,
                            color: AppColors.kPrimaryColor,
                            fontSize: height / 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
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
                                fontSize: height / 65,
                              ),
                            ),
                          ),
                          const SignInForm(),
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height / 70),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: height / 50,
                                    fontFamily: alexandria,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height / 35),
                            child: Text(
                              "Sign up with Email, Apple or Google",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: height / 65,
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
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/icons/apple_box.svg',
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/icons/google_box.svg',
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Positioned(
                bottom: -48,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.kBackground,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ).then((value) {
    isSignInDialogueShown = false;
    return null;
  });
}
