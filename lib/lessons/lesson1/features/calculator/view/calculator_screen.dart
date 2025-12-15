import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lesson1/core/theme/app_colors.dart';
import 'package:it_space_lessons/lessons/lesson1/core/theme/app_text_styles.dart';
import 'package:it_space_lessons/lessons/lesson1/core/widgets/app_button.dart';
import 'package:it_space_lessons/lessons/lesson1/features/calculator/logic/calculator_controller.dart';
import 'package:it_space_lessons/lessons/lesson1/features/calculator/view/widgets/name_textField.dart';
import 'package:it_space_lessons/lessons/lesson1/features/calculator/view/widgets/number_textField.dart';
import 'package:it_space_lessons/lessons/lesson1/features/calculator/view/widgets/result_display.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final _logic = CalculatorController();

  @override
  void initState() {
    super.initState();
    _logic.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _num1Controller.dispose();
    _num2Controller.dispose();
    _logic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: AppColors.white),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.blue,
        centerTitle: true,
        title: Text("Понятие переменные", style: AppTextStyles.appBarTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.share_outlined, color: AppColors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                NumberTextFieldRow(
                  controllerA: _num1Controller,
                  controllerB: _num2Controller,
                ),
                const SizedBox(height: 20.0),
                ResultDisplay(result: _logic.result),
                AppButton(
                  title: "Сложение",
                  onPressed: () => _logic.addition(
                    _num1Controller.text,
                    _num2Controller.text,
                  ),
                ),
                const SizedBox(height: 20.0),
                AppButton(
                  title: "Вычитание",
                  onPressed: () => _logic.subtraction(
                    _num1Controller.text,
                    _num2Controller.text,
                  ),
                ),
                const SizedBox(height: 20.0),
                AppButton(
                  title: "Умножение",
                  onPressed: () => _logic.multiplication(
                    _num1Controller.text,
                    _num2Controller.text,
                  ),
                ),
                const SizedBox(height: 20.0),
                AppButton(
                  title: "Деление",
                  onPressed: () => _logic.division(
                    _num1Controller.text,
                    _num2Controller.text,
                  ),
                ),
                const SizedBox(height: 20.0),
                Divider(),
                const SizedBox(height: 20.0),
                Text(
                  "Добро пожаловать ${_logic.greetingTitle}",
                  style: AppTextStyles.header,
                ),
                const SizedBox(height: 15.0),
                NameTextField(
                  nameController: _nameController,
                  title: "Введите имя",
                ),
                const SizedBox(height: 20),
                AppButton(
                  title: "Добавить и показать",
                  onPressed: () => _logic.updateGreeting(_nameController.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
