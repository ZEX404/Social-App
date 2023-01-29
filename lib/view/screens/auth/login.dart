// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/scrollbehavier.dart';
import 'package:ecommerce_app/core/constants/apilinks.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/view/screens/auth/animation_enum.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import '../../../core/functions/validinput.dart';

late double height;
late double width;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  Crud crud = Crud();

  login() async {
    if (formstate.currentState!.validate()) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      var response = await crud.postRequest(loginLink, {
        "email": emailController.text.trim(),
        "password": passwordController.text,
      });

      if (response['status'] == 'success') {
        sharedPref.setString("email", emailController.text.trim());
        sharedPref.setString("password", passwordController.text);
        Get.offAllNamed(AppRoutes.home);
      } else {
        final snackbar = SnackBar(
          backgroundColor: Colors.white.withOpacity(0.8),
          showCloseIcon: true,
          closeIconColor: Colors.red,
          margin: const EdgeInsets.all(8),
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          content: Text(
            response['message'],
            style: GoogleFonts.alexandria(
              color: Colors.red,
            ),
          ),
          duration: const Duration(seconds: 5),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHands_up;
  late RiveAnimationController controllerhands_down;
  late RiveAnimationController controllersuccess;
  late RiveAnimationController controllerfail;
  late RiveAnimationController controllerLook_down_right;
  late RiveAnimationController controllerLook_down_left;

  @override
  void initState() {
    super.initState();

    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHands_up = SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerhands_down = SimpleAnimation(AnimationEnum.hands_down.name);
    controllersuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerfail = SimpleAnimation(AnimationEnum.fail.name);
    controllerLook_down_right =
        SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLook_down_left =
        SimpleAnimation(AnimationEnum.Look_down_left.name);

    rootBundle.load('assets/bear.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.kPrimaryColor,
          ),
        ),
        title: Text(
          "Sign In",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 20,
              ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.kBackground,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formstate,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Image.asset('assets/images/icon.png',
                  //     height: 180, fit: BoxFit.fitHeight),
                  // const SizedBox(height: 10),
                  // Text(
                  //   "Welcome Back",
                  //   textAlign: TextAlign.center,
                  //   style: GoogleFonts.roboto(
                  //     fontSize: 26,
                  //     color: AppColors.kTextColor,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // Text(
                  //   "Insert your details to sign in",
                  //   textAlign: TextAlign.center,
                  //   style: GoogleFonts.roboto(
                  //     fontSize: 14,
                  //     color: AppColors.kTextColor.withOpacity(0.7),
                  //   ),
                  // ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: riveArtboard == null
                        ? const SizedBox.shrink()
                        : Rive(
                            artboard: riveArtboard!,
                          ),
                  ),

                  CustomTextForm(
                    TextInputAction: TextInputAction.next,
                    hintText: "Enter your Email",
                    label: "Email",
                    iconData: Icons.email_outlined,
                    myController: emailController,
                    validator: (val) {
                      return validInput(val!, 1, 50, "email");
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    TextInputAction: TextInputAction.done,
                    hintText: "Enter your Password",
                    label: "Password",
                    iconData: Icons.lock_outlined,
                    myController: passwordController,
                    validator: (val) {
                      return validInput(val!, 1, 50, "password");
                    },
                  ),
                  const SizedBox(height: 25),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 45,
                    width: isLoading ? 45 : width,
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      onPressed: () async {
                        if (isLoading != true) {
                          login();
                        }
                      },
                      splashColor: Colors.transparent.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(
                          color: AppColors.kBackground,
                        ),
                      ),
                      elevation: 0,
                      color: AppColors.kPrimaryColor,
                      child: FittedBox(
                        child: isLoading
                            ? Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.kPrimaryColor,
                                ),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  backgroundColor: AppColors.kPrimaryColor,
                                ),
                              )
                            : Text(
                                "Sign In",
                                style: GoogleFonts.alexandria(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildSmallButton() {
  return Container(
    width: 45,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.kPrimaryColor,
    ),
    child: const CircularProgressIndicator(
      color: AppColors.kBackground,
      backgroundColor: Colors.indigo,
    ),
  );
}
