import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

// SizedBox(height: 30.h),
// const Text(
//   'Watch your videos',
//   style: TextStyle(
//     fontSize: 50,
//     fontWeight: FontWeight.w700,
//   ),
// ),
// const SizedBox(height: 12),
// Text(
//   'Videos are personalized for you based on what you watch, like, and share.',
//   style: TextStyle(
//     fontSize: 24,
//     color: Colors.black.withOpacity(0.66),
//   ),
// ),

enum Direction { left, right }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx < 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.right) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterTap() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: AnimatedCrossFade(
          firstChild: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 50.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                const Text(
                  'Watch your videos',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Videos are personalized for you based on what you watch, like, and share.',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black.withOpacity(0.66),
                  ),
                ),
              ],
            ),
          ),
          secondChild: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 50.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                const Text(
                  'Personalized for you',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '제공..........................................................................................',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black.withOpacity(0.66),
                  ),
                ),
              ],
            ),
          ),
          crossFadeState: _showingPage == Page.second
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 80.h,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _showingPage == Page.second ? 1 : 0,
              child: CupertinoButton(
                color: Theme.of(context).primaryColor,
                onPressed: _onEnterTap,
                child: const Text(
                  'Enter the App',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
