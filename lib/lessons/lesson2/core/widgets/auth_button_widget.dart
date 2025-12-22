import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  final String? iconPath;
  final String text;
  final Color color;
  final Color? textColor;
  final VoidCallback? onPressed;
  const AuthButtonWidget({
    super.key,
    this.iconPath,
    required this.text,
    required this.color,
    this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, 60.0),
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
                Image.asset(iconPath!, height: 24.0, width: 24.0),
              const Spacer(),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
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
