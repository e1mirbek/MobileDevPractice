import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  final String? iconPath;
  final String text;
  final Color color;
  final Color textColor;
  final FontWeight textFontWeight;
  void Function()? onPressed;
  AuthButtonWidget({
    super.key,
    this.iconPath,
    required this.text,
    required this.color,
    this.textColor = Colors.transparent,
    required this.textFontWeight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        maximumSize: Size(double.infinity, 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              if (iconPath != null)
                Image.asset(iconPath!, height: 24.0, width: 24.0)
              else
                const SizedBox(width: 24),
              const Spacer(),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                  fontWeight: textFontWeight,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
