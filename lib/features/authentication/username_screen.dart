import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

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
              'Create username',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              'You can always change this later.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.45),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: 'Username',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => _onNextTap(),
              child: FormButton(disabled: _username.isEmpty),
            ),
          ],
        ),
      ),
    );
  }
}
