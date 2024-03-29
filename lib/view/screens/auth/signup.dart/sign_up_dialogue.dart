import 'package:ecommerce_app/view/screens/auth/signup.dart/sign_up_form.dart';
import 'package:flutter/material.dart';
import '../../../../core/class/scrollbehavier.dart';
import '../../../../core/constants/colors.dart' show AppColors;
import '../../../../core/services/services.dart' show alexandria;
import '../../onboarding.dart' show isSignUpDialogueShown;
import '../../../widgets/onboarding/slider.dart';

Future<Object?> customSignUpDialogue(BuildContext context) {
  return showGeneralDialog(
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
            SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            duration: const Duration(seconds: 2),
            alignment: Alignment.center,
            height: height / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Center(
                  child: AnimatedContainer(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    duration: const Duration(seconds: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 12),
                                Text(
                                  "Sign Up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: alexandria,
                                    color: AppColors.kPrimaryColor,
                                    fontSize: 34,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Fill the fields to create your account",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: alexandria,
                                    color: Colors.black45,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const SignUpForm(),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ).then((value) {
    isSignUpDialogueShown = false;
    return null;
  });
}
