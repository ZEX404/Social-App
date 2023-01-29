import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonLang extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: AppColors.kTextColor)),
        elevation: 0,
        color: Colors.cyan.withOpacity(0.2),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.notoKufiArabic(
            color: AppColors.kTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
