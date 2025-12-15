// Общие кнопки, инпуты

import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lesson1/core/theme/app_colors.dart';
import 'package:it_space_lessons/lessons/lesson1/core/theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const AppButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        minimumSize: Size(double.infinity, 60),
      ),
      onPressed: onPressed,
      child: Center(child: Text(title, style: AppTextStyles.buttonText)),
    );
  }
}
