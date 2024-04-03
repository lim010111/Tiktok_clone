import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              const Text(
                "Log in to TikTok",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              const Text(
                "Manage your account, check notifications, comment on videos, and more.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  AuthButton(
                    onTapFunc: (context) {},
                    faIcon: const FaIcon(FontAwesomeIcons.user),
                    text: 'Use phone or email',
                  ),
                  SizedBox(height: 10.h),
                  AuthButton(
                    onTapFunc: (context) {},
                    faIcon: const FaIcon(FontAwesomeIcons.facebook),
                    text: 'Continue with Facebook',
                  ),
                  SizedBox(height: 10.h),
                  AuthButton(
                    onTapFunc: (context) {},
                    faIcon: const FaIcon(FontAwesomeIcons.apple),
                    text: 'Continue with Apple',
                  ),
                  SizedBox(height: 10.h),
                  AuthButton(
                    onTapFunc: (context) {},
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
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
            ),
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: () => onSignUpTap(context),
              child: Text(
                'Sign up',
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
