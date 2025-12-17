import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lessons2/core/theme/app_colors.dart';
import 'package:it_space_lessons/lessons/lessons2/core/theme/app_text_styles.dart';
import 'package:it_space_lessons/lessons/lessons2/features/onboarding/models/onboarding_model.dart';
import 'package:it_space_lessons/lessons/lessons2/features/onboarding/view/widgets/indicator_widget.dart';
import 'package:it_space_lessons/lessons/lessons2/features/onboarding/view/widgets/text_button_widget.dart';
import 'package:it_space_lessons/main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose(); // Освобождаем контроллер при уничтожении виджета
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> contents = OnboardingModel.content;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          scrollBehavior: AppScrollBehavior(), // Подключаем локально
          itemCount: contents.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      contents[index].imgPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    contents[index].title,
                    style: AppTextStyles.titleTextStyle,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    textAlign: TextAlign.center,
                    contents[index].description,
                    style: AppTextStyles.descriptionTextStyle,
                  ),
                  const SizedBox(height: 47.0),
                  Row(
                    children: [
                      TextButtonWidget(
                        title: "Skip",
                        onPressed: () {
                          _pageController.jumpToPage(contents.length - 1);
                        },
                        foregroundColor: index == contents.length - 1
                            ? AppColors.grey
                            : AppColors.green,
                      ),
                      const Spacer(),
                      Row(
                        children: List.generate(
                          contents.length,
                          (i) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: IndicatorWidget(
                              backgroundColor: index == i
                                  ? AppColors.green
                                  : AppColors.grey,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButtonWidget(
                        title: "Next",
                        onPressed: () {
                          if (index < contents.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        foregroundColor: index == contents.length - 1
                            ? AppColors.grey
                            : AppColors.green,
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
