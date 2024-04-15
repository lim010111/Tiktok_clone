import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTap extends StatelessWidget {
  const NavTap({
    super.key,
    required this.name,
    required this.icon,
    required this.selectedIcon,
    required this.isSelected,
    required this.onTap,
    required this.color,
  });

  final String name;
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final Color color;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isSelected ? 1 : 0.60,
          child: Column(
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
                color: color,
              ),
              const SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
