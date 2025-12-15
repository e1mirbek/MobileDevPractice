import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextFieldRow extends StatelessWidget {
  final TextEditingController controllerA;
  final TextEditingController controllerB;
  const NumberTextFieldRow({
    super.key,
    required this.controllerA,
    required this.controllerB,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildNumberField(controllerA)),
        const SizedBox(width: 20.0),
        Expanded(child: _buildNumberField(controllerB)),
      ],
    );
  }

  Widget _buildNumberField(TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
