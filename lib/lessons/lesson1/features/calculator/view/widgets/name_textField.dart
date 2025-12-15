import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  final String title;
  final TextEditingController nameController;
  const NameTextField({
    super.key,
    required this.nameController,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: title,
        border: OutlineInputBorder(),
      ),
    );
  }
}
