import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 5),
      onPressed: onPressed,
      splashColor: AppColors.kTextColor.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: AppColors.kTextColor,
        ),
      ),
      elevation: 0,
      color: AppColors.kPrimaryColor,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
