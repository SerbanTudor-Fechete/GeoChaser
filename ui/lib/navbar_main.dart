import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class NavBarMain extends StatefulWidget {
  const NavBarMain({super.key});

  @override
  State<NavBarMain> createState() => _NavBarMain();
}

class _NavBarMain extends State<NavBarMain> {
  final NotchBottomBarController _controller = NotchBottomBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller, // Use a persistent controller
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.home),
            activeItem: Icon(Icons.home_filled)),
          BottomBarItem(
              inActiveItem: Icon(Icons.search),
              activeItem: Icon(Icons.search_rounded)),
          BottomBarItem(
              inActiveItem: Icon(Icons.add),
              activeItem: Icon(Icons.add_circle)),
        ],
        onTap: (index) {
          setState(() {});
        },
        kIconSize: 30,
        kBottomRadius: 20,
      ),
    );
  }
}
