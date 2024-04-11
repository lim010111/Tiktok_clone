import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({super.key});

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -3.4.w,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            height: 28.7.h,
            width: 20.w,
            decoration: BoxDecoration(
              color: const Color(0xff76D7E7),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Positioned(
          left: 17.1.w,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 300),
            height: 28.7.h,
            width: 20.w,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          child: const FaIcon(
            FontAwesomeIcons.plus,
          ),
        ),
      ],
    );
  }
}
