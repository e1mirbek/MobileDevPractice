import 'package:flutter/material.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_text_styles.dart';
import 'package:it_space_lessons/lessons/lesson2/core/theme/app_colors.dart';
import 'package:it_space_lessons/lessons/lesson2/core/constants/app_assets.dart';
import 'package:it_space_lessons/lessons/lesson2/core/utils/app_validators.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_Input_field.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_button_widget.dart';
import 'package:it_space_lessons/lessons/lesson2/core/widgets/auth_rich_text_widget.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store/view/home_page.dart';
import 'package:it_space_lessons/lessons/lesson2/features/grocery_store/view/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // 👉 ключ, который даёт доступ к состоянию виджета Form
  final _formKey = GlobalKey<FormState>();

  // check form
  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  bool _obscureText = true;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(
        title: "Welcome",
        onPressed: () => Navigator.pop(context),
      ),
      body: Stack(
        children: [
          _backroundImage(bgImage: AppAssets.checking),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottomContent(context),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar({
    required String title,
    required void Function()? onPressed,
  }) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back, color: AppColors.white, size: 30),
      ),
      title: Text(title, style: AppTextStyles.welcomeTextStyle),
    );
  }

  Widget _backroundImage({required String bgImage}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(bgImage)),
      ),
    );
  }

  Widget _bottomContent(BuildContext context) {
    return Container(
      height: 450.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back !", style: AppTextStyles.titleTextStyle),
              Text(
                "Sign in to your account",
                style: AppTextStyles.descriptionTextStyle,
              ),
              const SizedBox(height: 25.0),
              // ------------
              // EMAIL ADDRESS
              // ------------
              AuthInputField(
                validator: AppValidators.emailValidate,
                controller: _emailController,
                hintText: "Email Address",
                iconPath: AppAssets.emailIcon,
              ),
              const SizedBox(height: 5.0),
              // -------
              // PASSWORD
              // --------
              AuthInputField(
                validator: AppValidators.passwordValidate,
                controller: _passwordController,
                obscureText: _obscureText,
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
                          size: 25.0,
                          color: AppColors.coolGrey,
                        ),
                ),
                hintText: "Password",
                iconPath: AppAssets.chevronIcon,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  _scaledSwitch(),
                  Text(
                    "Remember me",
                    style: AppTextStyles.descriptionTextStyle,
                  ),
                  const Spacer(),
                  Text("Forgot password", style: AppTextStyles.forgotTextStyle),
                ],
              ),
              const SizedBox(height: 17.0),
              AuthButtonWidget(
                text: "Login",
                color: AppColors.green,
                textColor: AppColors.white,
                onPressed: () => login(),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: AuthRichTextWidget(
                  mainText: "Don’t have an account ? ",
                  actionText: "Sign up",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scaledSwitch() {
    return Transform.scale(
      scale: 0.7,
      child: Switch(
        thumbColor: const MaterialStatePropertyAll(AppColors.coolGrey),
        trackColor: const MaterialStatePropertyAll(AppColors.backround),
        trackOutlineColor: const MaterialStatePropertyAll(AppColors.grey),
        trackOutlineWidth: const MaterialStatePropertyAll(2.0),
        value: switchValue,
        onChanged: (value) {},
      ),
    );
  }
}
