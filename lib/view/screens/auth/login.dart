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
import 'package:get/get_connect/http/src/utils/utils.dart';
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
        addcontrollersuccess();
        await Future.delayed(const Duration(seconds: 3));
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
        addcontrollerfail();
      }
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      addcontrollerfail();
    }
  }

  bool isObsecure = true;

  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHands_up;
  late RiveAnimationController controllerhands_down;
  late RiveAnimationController controllersuccess;
  late RiveAnimationController controllerfail;
  late RiveAnimationController controllerLook_down_right;
  late RiveAnimationController controllerLook_down_left;

  final passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHands_up);
    riveArtboard?.artboard.removeController(controllerhands_down);
    riveArtboard?.artboard.removeController(controllersuccess);
    riveArtboard?.artboard.removeController(controllerfail);
    riveArtboard?.artboard.removeController(controllerLook_down_right);
    riveArtboard?.artboard.removeController(controllerLook_down_left);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addcontrollerIdle() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint("Idle");
  }

  void addcontrollerHands_up() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHands_up);
    debugPrint("Hands_up");
  }

  void addcontrollerhands_down() async {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerhands_down);
    debugPrint("hands_down");
    await Future.delayed(const Duration(seconds: 1));
    addcontrollerIdle();
  }

  void addcontrollersuccess() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllersuccess);
    debugPrint("success");
  }

  void addcontrollerfail() async {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerfail);
    debugPrint("fail");
    await Future.delayed(const Duration(seconds: 3));
    addcontrollerIdle();
  }

  void addcontrollerLook_down_right() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerLook_down_right);
    isLookingRight = true;
    debugPrint("Look_down_right");
  }

  void addcontrollerLook_down_left() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerLook_down_left);
    isLookingLeft = true;
    debugPrint("Look_down_left");
  }

  void checkPasswordFocusNode() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addcontrollerHands_up();
      } else if (!passwordFocusNode.hasFocus) {
        addcontrollerhands_down();
      }
    });
  }

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
    checkPasswordFocusNode();
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: riveArtboard == null
                        ? const SizedBox.shrink()
                        : Rive(
                            artboard: riveArtboard!,
                          ),
                  ),
                  CustomTextForm(
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          value.length < 15 &&
                          !isLookingLeft) {
                        addcontrollerLook_down_left();
                      } else if (value.isNotEmpty &&
                          value.length > 15 &&
                          !isLookingRight) {
                        addcontrollerLook_down_right();
                      }
                    },
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
                  TextFormField(
                    obscureText: isObsecure,
                    focusNode: passwordFocusNode,
                    validator: (val) {
                      return validInput(val!, 1, 50, "password");
                    },
                    controller: passwordController,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                        ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.6),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.red.withOpacity(0.2),
                        ),
                      ),
                      errorStyle: GoogleFonts.alexandria(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(
                        color: AppColors.kTextColor.withOpacity(0.6),
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      label: const Text(
                        "Password",
                        style: TextStyle(
                          color: AppColors.kTextColor,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        splashRadius: 10,
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: isObsecure
                            ? const Icon(
                                Icons.visibility,
                                color: AppColors.kTextColor,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppColors.kTextColor,
                              ),
                      ),
                      prefixIcon: const Icon(Icons.lock_outlined,
                          color: AppColors.kTextColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: AppColors.kTextColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.kTextColor.withOpacity(0.2),
                        ),
                      ),
                    ),
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
                          passwordFocusNode.unfocus();
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
