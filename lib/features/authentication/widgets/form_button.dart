import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final bool disabled;

  const FormButton({
    super.key,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
              disabled ? Colors.grey.shade200 : Theme.of(context).primaryColor,
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: disabled ? Colors.grey.withOpacity(0.55) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          duration: const Duration(milliseconds: 300),
          child: Text(
            disabled ? "Sign up" : 'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
