import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoStatButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double size;

  const VideoStatButton({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          icon,
          color: color,
          size: size,
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
