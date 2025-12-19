import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_colors.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_text_styles.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_button_widget.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_rich_text_widget.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store/view/login_screen.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store/view/sign_up_screen.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Welcome", style: AppTextStyles.welcomeTextStyle),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          _backgroundImage(imagePath: "assets/images/beautiful.png"),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottomContent(context),
          ),
        ],
      ),
    );
  }

  // Background image
  Widget _backgroundImage({required String imagePath}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath)),
      ),
    );
  }

  // Bottom content
  Widget _bottomContent(BuildContext context) {
    return Container(
      height: 360.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: AppTextStyles.titleTextStyle),
            const SizedBox(height: 2.0),
            Text(
              "Lorem ipsum dolor sit amet, consecrate disciplining elite, sed diam nonnull",
              style: AppTextStyles.descriptionTextStyle,
            ),
            const SizedBox(height: 24.0),
            AuthButtonWidget(
              iconPath: "assets/icons/google_icon.png",
              text: "Continue with google",
              textColor: AppColors.black,
              color: AppColors.white,
              textFontWeight: FontWeight.w500,
              onPressed: () => developer.log("open register with google"),
            ),
            const SizedBox(height: 12.0),
            AuthButtonWidget(
              iconPath: "assets/icons/user_icon.png",
              text: "Create an account",
              textColor: AppColors.white,
              color: AppColors.green,
              textFontWeight: FontWeight.w700,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: AuthRichTextWidget(
                mainText: "Already have an account ? ",
                actionText: "Login",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
