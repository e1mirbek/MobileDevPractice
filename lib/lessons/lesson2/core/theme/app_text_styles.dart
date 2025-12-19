import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();
  static TextStyle titleTextStyle = GoogleFonts.poppins(
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );
  static TextStyle descriptionTextStyle = GoogleFonts.poppins(
    color: AppColors.grey,
    fontSize: 15,
  );
  static TextStyle welcomeTextStyle = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonTextStyle = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );
}
