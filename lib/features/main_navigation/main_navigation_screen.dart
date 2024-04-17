import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 3;
  int loadingTime = 1;
  bool isMoved = false;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (timer.tick == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Scaffold(
                    appBar: AppBar(),
                  ),
              fullscreenDialog: true),
        );
        timer.cancel();
      }
    });
  }

  void _onTapUp() {
    setState(() {
      isMoved = false;
    });
  }

  void _onTapDown() {
    setState(() {
      isMoved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: Container(),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: Container(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _currentIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavTap(
                isSelected: _currentIndex == 0,
                name: "Home",
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
                color: _currentIndex == 0 ? Colors.white : Colors.black,
              ),
              NavTap(
                isSelected: _currentIndex == 1,
                name: "Discover",
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
                color: _currentIndex == 0 ? Colors.white : Colors.black,
              ),
              GestureDetector(
                onTapDown: (details) => _onTapDown(),
                onTapUp: (details) {
                  _onTapUp();
                  _onPostVideoButtonTap();
                },
                child: AnimatedScale(
                  scale: isMoved ? 0.85 : 1,
                  duration: const Duration(milliseconds: 220),
                  child: PostVideoButton(isHome: _currentIndex == 0),
                ),
              ),
              NavTap(
                isSelected: _currentIndex == 3,
                name: 'Inbox',
                icon: FontAwesomeIcons.comment,
                selectedIcon: FontAwesomeIcons.solidComment,
                onTap: () => _onTap(3),
                color: _currentIndex == 0 ? Colors.white : Colors.black,
              ),
              NavTap(
                isSelected: _currentIndex == 4,
                name: 'Profile',
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
                color: _currentIndex == 0 ? Colors.white : Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
