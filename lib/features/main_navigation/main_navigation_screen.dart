import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        indicatorColor: Colors.white10,
        indicatorShape: const CircleBorder(eccentricity: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: _onTap,
        selectedIndex: _currentIndex,
        animationDuration: const Duration(milliseconds: 500),
        destinations: _destinations,
      ),
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   int _currentIndex = 0;
//   void _onTap(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       onTap: _onTap,
//       currentIndex: _currentIndex,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.white54,
//       items: const [
//         BottomNavigationBarItem(
//           backgroundColor: Colors.black,
//           icon: FaIcon(FontAwesomeIcons.house),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           backgroundColor: Colors.black,
//           icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
//           label: "Discover",
//         ),
//         BottomNavigationBarItem(
//           backgroundColor: Colors.black,
//           icon: FaIcon(FontAwesomeIcons.comment),
//           label: "Inbox",
//         ),
//         BottomNavigationBarItem(
//           backgroundColor: Colors.black,
//           icon: FaIcon(FontAwesomeIcons.user),
//           label: "Profile",
//         ),
//       ],
//     );
//   }
// }
