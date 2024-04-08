import 'package:flutter/material.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.08),
          ),
          borderRadius: BorderRadius.circular(40),
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.4,
              blurRadius: 5,
            )
          ],
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
          duration: const Duration(milliseconds: 150),
          child: Text(
            widget.interest,
          ),
        ),
      ),
    );
  }
}
