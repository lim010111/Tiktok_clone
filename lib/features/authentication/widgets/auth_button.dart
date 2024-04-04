import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon faIcon;
  final void Function(BuildContext) onTapFunc;

  const AuthButton({
    super.key,
    required this.text,
    required this.faIcon,
    required this.onTapFunc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapFunc(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: faIcon,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
