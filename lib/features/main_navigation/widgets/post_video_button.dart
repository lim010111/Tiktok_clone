import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({
    super.key,
    required this.isHome,
  });

  final bool isHome;

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-8.4, 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -4.6,
            bottom: 0.8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 300),
              height: 37,
              width: 25,
              decoration: BoxDecoration(
                color: const Color(0xff76D7E7),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            left: 29.6,
            bottom: 0.8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 300),
              height: 37,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.isHome ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 14.5,
              vertical: 6.8,
            ),
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: widget.isHome ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
