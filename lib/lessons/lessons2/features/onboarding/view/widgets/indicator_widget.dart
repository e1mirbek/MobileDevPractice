import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  final Color backgroundColor;
  const IndicatorWidget({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 8.0, backgroundColor: backgroundColor);
  }
}
