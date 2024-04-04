import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              const Text(
                "Sign up for TikTok",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              const Text(
                "Create a profile, follow other accounts, make your own videos, and more.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  AuthButton(
                    onTapFunc: _onEmailTap,
                    faIcon: const FaIcon(FontAwesomeIcons.user),
                    text: 'Use email and password',
                  ),
                  SizedBox(height: 10.h),
                  AuthButton(
                    onTapFunc: _onEmailTap,
                    faIcon: const FaIcon(FontAwesomeIcons.facebook),
                    text: 'Continue with Facebook',
                  ),
                  SizedBox(height: 10.h),
                  AuthButton(
                    onTapFunc: _onEmailTap,
                    faIcon: const FaIcon(FontAwesomeIcons.apple),
                    text: 'Continue with Apple',
                  ),
                  SizedBox(height: 10.h),
                  AuthButton(
                    onTapFunc: _onEmailTap,
                    faIcon: const FaIcon(FontAwesomeIcons.google),
                    text: 'Continue with Google',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.withOpacity(0.01),
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
            ),
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: () => _onLoginTap(context),
              child: Text(
                'Log in',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
