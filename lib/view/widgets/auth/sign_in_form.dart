
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/services/services.dart';
import 'customtextform.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

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
              myController: TextEditingController(),
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
              hintText: "Enter your Password",
              label: "Password",
              iconData: "assets/icons/password.svg",
              myController: TextEditingController(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 25),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: AppColors.kPrimaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                  ),
                ),
              ),
              icon: const Icon(
                CupertinoIcons.arrow_right,
                color: Color(0xFFFE0037),
              ),
              label: Text(
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
    );
  }
}
