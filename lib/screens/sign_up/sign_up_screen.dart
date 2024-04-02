import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                "Sign up for TikTok",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              const Text(
                "Create a profile, follow other accounts, make your won videos, and more.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(boxShadow: []),
                    child: const Row(
                      children: [
                        Icon(Icons.abc),
                        Text('Use phone or email'),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.abc),
                      Text('Use phone or email'),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.abc),
                      Text('Use phone or email'),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.abc),
                      Text('Use phone or email'),
                    ],
                  )
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
              'Already have an account?',
            ),
            SizedBox(width: 5.w),
            Text(
              'Log in',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
