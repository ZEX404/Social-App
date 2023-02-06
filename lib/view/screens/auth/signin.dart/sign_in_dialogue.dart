import '../../../../core/class/scrollbehavier.dart';
import '../signup.dart/sign_up_dialogue.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/services/services.dart';
import '../../onboarding.dart';
import '../../../widgets/onboarding/slider.dart';
import 'sign_in_form.dart';

bool isShowLoading = false;

Future<Object?> customSignInDialogue(BuildContext context) {
  return showGeneralDialog(
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
                                  "Sign In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: alexandria,
                                    color: AppColors.kPrimaryColor,
                                    fontSize: 34,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Hi there! Enter your details to login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: alexandria,
                                    color: Colors.black45,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const SignInForm(),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const Expanded(child: Divider()),
                                    Text(
                                      "OR",
                                      style: TextStyle(
                                        color: Colors.black26,
                                        fontFamily: alexandria,
                                      ),
                                    ),
                                    const Expanded(child: Divider()),
                                  ],
                                ),
                                const SizedBox(height: 6),
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
                                ),
                                const SizedBox(height: 14),
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
    isSignInDialogueShown = false;
    if (isShowLoading) {
      isShowLoading = false;
    }
    return null;
  });
}
