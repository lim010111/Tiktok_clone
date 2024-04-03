import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            const Text(
              'Create Username',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 7),
            Text(
              'You can always change this later.',
              style: TextStyle(color: Colors.black.withOpacity(0.45)),
            ),
            const Text('Username'),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
