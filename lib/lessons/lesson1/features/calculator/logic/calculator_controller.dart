import 'package:flutter/material.dart';

class CalculatorController extends ChangeNotifier {
  double _result = 0.0;
  String _greetingTitle = "";

  // геттеры чтобы UI мог читать данные

  String get greetingTitle => _greetingTitle;

  double get result => _result;

  // Логика сложение

  void addition(String textA, String textB) {
    double numberA = double.tryParse(textA) ?? 0.0;
    double numberB = double.tryParse(textB) ?? 0.0;

    _result = numberA + numberB;
    notifyListeners();
  }

  // Логика вычитание

  void subtraction(String textA, String textB) {
    double numberA = double.tryParse(textA) ?? 0.0;
    double numberB = double.tryParse(textB) ?? 0.0;
    _result = numberA - numberB;
    notifyListeners();
  }

  // Логика умнажение

  void multiplication(String textA, String textB) {
    double numberA = double.tryParse(textA) ?? 0.0;
    double numberB = double.tryParse(textB) ?? 0.0;
    _result = numberA * numberB;
    notifyListeners();
  }

  // Логика деления

  void division(String textA, String textB) {
    double numberA = double.tryParse(textA) ?? 0.0;
    double numberB = double.tryParse(textB) ?? 0.0;

    _result = numberA / numberB;
    notifyListeners();
  }

  // Логика приветсвие

  void updateGreeting(String name) {
    _greetingTitle = name;
    notifyListeners();
  }
}
