import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _destinations = [
    const NavigationDestination(
      icon: FaIcon(
        FontAwesomeIcons.house,
        color: Colors.white,
      ),
      label: "House",
    ),
    const NavigationDestination(
      icon: FaIcon(
        FontAwesomeIcons.magnifyingGlass,
        color: Colors.white,
      ),
      label: "Discover",
    ),
    const NavigationDestination(
      icon: FaIcon(
        FontAwesomeIcons.comment,
        color: Colors.white,
      ),
      label: "Inbox",
    ),
    const NavigationDestination(
      icon: FaIcon(
        FontAwesomeIcons.user,
        color: Colors.white,
      ),
      label: "Profile",
    ),
  ];

  final List<Widget> _screens = [
    const Center(
      child: Text('asdasd'),
    ),
    const Center(
      child: Text('asda1sd'),
    ),
    const Center(
      child: Text('asda2sd'),
    ),
    const Center(
      child: Text('asd3asd'),
    )
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onTap: () => _onTap(0),
              ),
              NavTap(
                isSelected: _currentIndex == 1,
                name: "Discover",
                icon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: const FaIcon(FontAwesomeIcons.plus),
                ),
              ),
              NavTap(
                isSelected: _currentIndex == 3,
                name: 'Inbox',
                icon: FontAwesomeIcons.comment,
                onTap: () => _onTap(3),
              ),
              NavTap(
                isSelected: _currentIndex == 4,
                name: 'Profile',
                icon: FontAwesomeIcons.user,
                onTap: () => _onTap(4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
