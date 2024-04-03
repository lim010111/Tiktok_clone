import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      print(_usernameController.text);
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
              'What is your email?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 7),
            const SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: 'Email',
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
            FormButton(disabled: _username.isEmpty),
          ],
        ),
      ),
    );
  }
}
