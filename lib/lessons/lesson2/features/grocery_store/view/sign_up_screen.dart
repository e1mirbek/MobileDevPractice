import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lesson2/core/constants/app_assets.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_text_styles.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_colors.dart';
import 'package:it_space_lessons/lessons/lesson2/core/utils/app_validators.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_Input_field.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_button_widget.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_rich_text_widget.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store/view/home_page.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store/view/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  void register() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

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
          image: AssetImage(AppAssets.portrait),
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
        child: Form(
          key: _formKey,
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
              // ------------
              // EMAIL ADDRESS
              // ------------
              AuthInputField(
                validator: AppValidators.emailValidate,
                controller: emailEditingController,
                hintText: "Email address",
                iconPath: AppAssets.emailIcon,
              ),
              // -------
              // PHONE NUMBER
              // -------
              const SizedBox(height: 5.0),
              AuthInputField(
                validator: AppValidators.phoneNumberValidate,
                controller: phoneNumberController,
                hintText: "Введите номер телефона",
                iconPath: AppAssets.phoneNumberIcon,
              ),
              // -------
              // PASSWORD
              // --------
              const SizedBox(height: 5.0),
              AuthInputField(
                validator: AppValidators.passwordValidate,
                obscureText: _obscureText,
                controller: passwordEditingController,
                hintText: "Password",
                iconPath: AppAssets.chevronIcon,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: _obscureText
                      ? Icon(
                          Icons.visibility_off_outlined,
                          size: 25.0,
                          color: AppColors.coolGrey,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          size: 25,
                          color: AppColors.coolGrey,
                        ),
                ),
              ),
              // ------
              // SIGN UP
              // -------
              const Spacer(),
              AuthButtonWidget(
                text: "Signup",
                color: AppColors.green,
                textColor: AppColors.white,
                onPressed: () => register(),
              ),
              const Spacer(),
              Center(
                child: AuthRichTextWidget(
                  mainText: "Already have an account ? ",
                  actionText: "Login",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
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
