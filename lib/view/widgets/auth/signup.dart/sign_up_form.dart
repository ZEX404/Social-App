import 'package:ecommerce_app/view/screens/auth/continueSignUp.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/functions/validinput.dart';
import '../../../../core/services/services.dart';
import '../customtextform.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

FToast fToast = FToast();

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordControllerConfirm = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

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

  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: CustomTextForm(
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
              isObsecure: true,
              validator: (val) {
                return validInput(val!, 6, 50, "password");
              },
              TextInputAction: TextInputAction.next,
              hintText: "Enter your password",
              label: "Password",
              iconData: "assets/icons/password.svg",
              myController: _passwordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: CustomTextForm(
              isObsecure: true,
              validator: (val) {
                return validInput(val!, 6, 50, "password");
              },
              TextInputAction: TextInputAction.done,
              hintText: "Re enter your password",
              label: "Confirm your password",
              iconData: "assets/icons/password.svg",
              myController: _passwordControllerConfirm,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ElevatedButton(
              onPressed: () {
                if (formstate.currentState == null) {
                  return;
                }
                if (formstate.currentState!.validate()) {
                  if (_passwordController.text ==
                      _passwordControllerConfirm.text) {
                    // passwords match
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContinueSignUpScreen(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      ),
                    );
                  } else {
                    // passwords don't match
                    _showToast("Passwords don't match");
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
                backgroundColor: const Color.fromARGB(255, 100, 226, 100),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                  ),
                ),
              ),
              child: Text(
                "Continue",
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
    );
  }
}
