// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final String label;
  final String? iconData;
  final TextInputAction;
  final TextEditingController myController;
  final String? Function(String?) validator;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final bool? isObsecure;
  final IconData? icon;

  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.label,
    this.iconData,
    required this.TextInputAction,
    required this.myController,
    required this.validator,
    this.focusNode,
    this.onChanged,
    this.isObsecure,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure ?? false,
      onChanged: onChanged,
      focusNode: focusNode,
      validator: validator,
      controller: myController,
      style: TextStyle(
          color: const Color.fromARGB(255, 20, 79, 176).withOpacity(0.9),
          fontSize: 17,
          fontFamily: nunito,
          fontWeight: FontWeight.bold),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.6),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.2),
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
          fontFamily: nunito,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.kTextColor.withOpacity(0.6),
          fontSize: 14,
          fontFamily: nunito,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.kTextColor,
            fontFamily: nunito,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: icon == null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  iconData!,
                ),
              )
            : Icon(
                icon,
                color: const Color.fromARGB(255, 20, 79, 176).withOpacity(0.9),
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.kTextColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.kTextColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
