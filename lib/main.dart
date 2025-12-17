import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lessons2/features/onboarding/view/onboarding_screen.dart';

void main() {
  runApp(HomePage());
}

// 1. Класс для разрешения свайпа мышкой
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse, // <--- Разрешаем мышь!
    PointerDeviceKind.trackpad,
  };
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 2. Подключаем поведение скролла глобально
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
