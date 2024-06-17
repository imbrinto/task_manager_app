import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/auth/email_verification_screen.dart';
import 'package:task_manager_app/ui/screens/auth/sign_up_screen.dart';
import 'package:task_manager_app/ui/screens/main_bottom_nav_bar.dart';
import 'package:task_manager_app/ui/utilities/app_colors.dart';
import 'package:task_manager_app/ui/widgets/background_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _onTapNavBottomNavBar();
                    },
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(height: 56),
                  _buildBackToSignInSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNavBottomNavBar() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainBottomNavBar(),
      ),
    );
  }

  Center _buildBackToSignInSection() {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              _onTapNavigateForgotPasswordPage();
            },
            child: const Text(
              'Forgot Password? ',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          RichText(
              text: TextSpan(
            children: [
              const TextSpan(
                text: "Don't have account? ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = _onTapNavigateSignUpPage,
                text: "Sign Up",
                style: const TextStyle(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )),
        ],
      ),
    );
  }

  void _onTapNavigateSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  void _onTapNavigateForgotPasswordPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
