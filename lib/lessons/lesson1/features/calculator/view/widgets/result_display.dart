import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lesson1/core/theme/app_text_styles.dart';

class ResultDisplay extends StatelessWidget {
  final double result;
  const ResultDisplay({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Text("$result", style: AppTextStyles.result);
  }
}
