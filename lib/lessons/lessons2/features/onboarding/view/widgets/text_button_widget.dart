import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lessons2/core/theme/app_colors.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final Color? foregroundColor;
  final Color overlayColor = AppColors.transparent;
  void Function()? onPressed;
  TextButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(overlayColor),
        foregroundColor: WidgetStateProperty.all(
          foregroundColor ?? AppColors.grey,
        ),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
