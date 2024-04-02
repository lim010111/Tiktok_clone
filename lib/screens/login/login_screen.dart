import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              "Don't have an account?",
            ),
            SizedBox(width: 5.w),
            Text(
              'Sign up',
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
