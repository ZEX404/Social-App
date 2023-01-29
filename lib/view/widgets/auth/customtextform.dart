// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/colors.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData iconData;
  final TextInputAction;
  final TextEditingController myController;
  final String? Function(String?) validator;

  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.label,
    required this.iconData,
    required this.TextInputAction,
    required this.myController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: myController,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black,
          ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction,
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
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.kTextColor.withOpacity(0.6),
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.kTextColor,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Icon(iconData, color: AppColors.kTextColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.kTextColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.kTextColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
