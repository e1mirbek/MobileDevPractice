import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_colors.dart';

class AuthInputField extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  const AuthInputField({
    super.key,
    required this.hintText,
    required this.iconPath,
    this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backround,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.coolGrey,
            ),
            prefixIcon: CircleAvatar(
              backgroundColor: AppColors.transparent,
              child: Image.asset(iconPath, fit: BoxFit.contain, width: 17.0),
            ),
            suffixIcon: suffixIcon,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
