import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";

  bool _isObscure = true;
  int passwordLevel = 0;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
        _isPasswordValid();
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _isPasswordValid() {
    if (_password.length >= 8 && _password.length <= 20) {
      if (RegExp(
              r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$")
          .hasMatch(_password)) {
        passwordLevel = 2;
      } else {
        passwordLevel = 1;
      }
    } else {
      passwordLevel = 0;
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onEyeTap() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _onSubmit() {
    if (_password.isEmpty || passwordLevel != 2) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sign up'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              const Text(
                'Create password',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: _isObscure,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => _passwordController.clear(),
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.withOpacity(0.6),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () => _onEyeTap(),
                        child: FaIcon(
                          _isObscure
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.withOpacity(0.6),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Your password must have:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 20,
                    color: passwordLevel >= 1 ? Colors.green : Colors.black,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '8 to 20 characters',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 20,
                    color: passwordLevel == 2 ? Colors.green : Colors.black,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    'Letters, numbers, and special characters',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => _onSubmit(),
                child: FormButton(
                  disabled: passwordLevel != 2,
                  text: "Next",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
