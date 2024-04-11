import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/onboarding/widgets/post_video_button.dart';
import 'package:tiktok_clone/stf.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const StfWidget(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(),
              ),
          fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: const StfWidget(),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: const StfWidget(),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: const StfWidget(),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: const StfWidget(),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: const StfWidget(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTap(
                isSelected: _currentIndex == 0,
                name: "Home",
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTap(
                isSelected: _currentIndex == 1,
                name: "Discover",
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
              ),
              InkWell(
                splashColor: Colors.lightGreen,
                onTap: () {
                  setState(() {});
                  _onPostVideoButtonTap();
                },
                child: const PostVideoButton(),
              ),
              NavTap(
                isSelected: _currentIndex == 3,
                name: 'Inbox',
                icon: FontAwesomeIcons.comment,
                selectedIcon: FontAwesomeIcons.solidComment,
                onTap: () => _onTap(3),
              ),
              NavTap(
                isSelected: _currentIndex == 4,
                name: 'Profile',
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
