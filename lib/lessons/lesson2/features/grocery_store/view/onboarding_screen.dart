import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_colors.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_sizes.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_text_styles.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store//models/onboarding_model.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store//view/welcome_auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final List<OnboardingModel> contents = OnboardingModel.content;
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < contents.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AuthWelcomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
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
                            contents[index].description,
                            style: AppTextStyles.descriptionTextStyle,
                          ),
                          SizedBox(height: AppSizes.sizedBox = 47.0),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  if (_currentPage != contents.length - 1)
                    _textButton(
                      onPressed: () =>
                          _pageController.jumpToPage(contents.length - 1),
                      title: "Skip",
                      foregroundColor: AppColors.grey,
                    )
                  else
                    const SizedBox(width: 48.0),
                  const Spacer(),
                  // indicator
                  Row(
                    children: List.generate(
                      contents.length,
                      (index) => _animatedContainer(
                        color: _currentPage == index
                            ? AppColors.green
                            : AppColors.grey,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _textButton(
                    onPressed: () => _nextPage(),
                    title: _currentPage == contents.length - 1
                        ? "Start"
                        : "Next",
                    foregroundColor: AppColors.green,
                  ),
                ],
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _textButton({
    required void Function()? onPressed,
    required String title,
    Color overlayColor = Colors.transparent,
    required Color foregroundColor,
  }) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(overlayColor),
        foregroundColor: WidgetStateProperty.all(foregroundColor),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }

  AnimatedContainer _animatedContainer({required Color color}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: AppSizes.indicatorRadius = 16,
      width: AppSizes.indicatorRadius = 16,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
