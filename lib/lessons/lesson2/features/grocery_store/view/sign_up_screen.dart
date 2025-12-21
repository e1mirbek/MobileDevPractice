import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_text_styles.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_colors.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_Input_field.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_button_widget.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_rich_text_widget.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store/view/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColors.white, size: 30),
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Welcome", style: AppTextStyles.welcomeTextStyle),
      ),
      body: Stack(
        children: [
          _backgroundImage(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottomContent(context),
          ),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/portrait.png"),
        ),
      ),
    );
  }

  Widget _bottomContent(BuildContext context) {
    return Container(
      height: 466.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create account", style: AppTextStyles.titleTextStyle),
            const SizedBox(height: 2.0),
            Text(
              "Quickly create account",
              style: AppTextStyles.descriptionTextStyle,
            ),
            const Spacer(),
            AuthInputField(
              controller: _emailEditingController,
              hintText: "Email address",
              iconPath: "assets/icons/email_icon.png",
            ),
            const SizedBox(height: 5.0),
            AuthInputField(
              hintText: "Phone number",
              iconPath: "assets/icons/telephone_icon.png",
            ),
            const SizedBox(height: 5.0),
            AuthInputField(
              controller: _passwordEditingController,
              hintText: "Password",
              iconPath: "assets/icons/chevron_icon.png",
              suffixIcon: Icon(
                Icons.visibility_outlined,
                color: AppColors.coolGrey,
                size: 26.0,
              ),
            ),
            const Spacer(),
            AuthButtonWidget(
              text: "Signup",
              color: AppColors.green,
              textColor: AppColors.white,
              textFontWeight: FontWeight.w600,
              onPressed: () {},
            ),
            const Spacer(),
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
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
