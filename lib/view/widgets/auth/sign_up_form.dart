import 'package:ecommerce_app/view/screens/auth/continueSignUp.dart';
import 'package:flutter/material.dart';
import '../../../core/services/services.dart';
import 'customtextform.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
  });

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordControllerConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: CustomTextForm(
              validator: (p0) {
                return null;
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
              validator: (p0) {
                return null;
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
              validator: (p0) {
                return null;
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContinueSignUpScreen(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
                );
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
