import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formDatas = {};

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onScaffoldTap(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please write your email";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formDatas['email'] = newValue;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                    ),
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
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please write your password";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formDatas['password'] = newValue;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                    ),
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
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: onSubmitTap,
                  child: const FormButton(
                    disabled: false,
                    text: "Login",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
