import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../../../core/class/crud.dart';
import '../../../../core/constants/apilinks.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/functions/validinput.dart';
import '../../../../core/services/services.dart';
import '../../../../main.dart';
import '../../../widgets/auth/customtextform.dart';
import 'sign_in_dialogue.dart';

FToast fToast = FToast();

final passwordFocusNode = FocusNode();
final emailFocusNode = FocusNode();

bool isShowConfetti = false;

GlobalKey<FormState> formstate = GlobalKey();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
Crud crud = Crud();

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  void initState() {
    fToast.init(context);

    super.initState();
  }

  _showToast(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.kBackground.withOpacity(0.7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: TextStyle(
              fontFamily: alexandria,
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
    if (mounted) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          fToast.showToast(
            child: toast,
            gravity: ToastGravity.BOTTOM,
            toastDuration: const Duration(milliseconds: 1400),
          );
        },
      );
    }
  }

  void signIn(BuildContext context) {
    if (isShowLoading == false) {
      isShowLoading = true;
      isShowConfetti = true;
      setState(() {});
      Future.delayed(
        const Duration(milliseconds: 450),
        () async {
          if (formstate.currentState == null) {
            return;
          }
          if (formstate.currentState!.validate()) {
            // continue
            var response = await crud.postRequest(loginLink, {
              "email": _emailController.text.trim(),
              "password": _passwordController.text,
            });

            if (response['status'] == 'success') {
              sharedPref.setString("email", _emailController.text.trim());
              sharedPref.setString("password", _passwordController.text);
              check.fire();
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  isShowLoading = false;
                  if (mounted) {
                    setState(() {});
                    confetti.fire();
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        isShowConfetti = false;
                        Get.offAllNamed(AppRoutes.home);
                      },
                    );
                  }
                },
              );
            } else {
              // print(response['message']);

              _showToast(response['message']);

              error.fire();
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  isShowLoading = false;
                  isShowConfetti = false;
                  if (mounted) {
                    setState(() {});
                  }
                },
              );
            }
            //
          } else {
            error.fire();
            Future.delayed(
              const Duration(seconds: 2),
              () {
                isShowLoading = false;
                isShowConfetti = false;
                if (mounted) {
                  setState(() {});
                }
              },
            );
          }
        },
      );
    }
  }

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formstate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: CustomTextForm(
                  focusNode: emailFocusNode,
                  validator: (val) {
                    return validInput(val!, 1, 50, "email");
                  },
                  TextInputAction: TextInputAction.next,
                  hintText: "Enter your Email",
                  label: "Email",
                  iconData: "assets/icons/email.svg",
                  myController: _emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: CustomTextForm(
                  focusNode: passwordFocusNode,
                  isObsecure: true,
                  validator: (val) {
                    return validInput(val!, 1, 50, "password");
                  },
                  TextInputAction: TextInputAction.done,
                  hintText: "Enter your Password",
                  label: "Password",
                  iconData: "assets/icons/password.svg",
                  myController: _passwordController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: () async {
                    emailFocusNode.unfocus();
                    passwordFocusNode.unfocus();
                    signIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 45),
                    backgroundColor: AppColors.kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: alexandria,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  'assets/animations/check.riv',
                  onInit: (artboard) {
                    StateMachineController controller =
                        getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    'assets/animations/confetti.riv',
                    onInit: (artboard) {
                      StateMachineController controller =
                          getRiveController(artboard);
                      confetti =
                          controller.findSMI("Trigger explosion") as SMITrigger;
                    },
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}
