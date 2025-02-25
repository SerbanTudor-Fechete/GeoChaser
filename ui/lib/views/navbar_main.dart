import 'package:flutter/material.dart';
import 'package:geo_chaser/views/leadboards_screen.dart';
import 'package:geo_chaser/views/profile_screen.dart';
import 'package:geo_chaser/views/home_screen.dart';

class NavBarMain extends StatefulWidget {
  const NavBarMain({super.key});

  @override
  State<NavBarMain> createState() => _NavBarMainState();
}

class _NavBarMainState extends State<NavBarMain> {
  int currentPageIndex = 1;

  static const List<NavigationDestination> destinations = [
    NavigationDestination(
      icon: Icon(Icons.leaderboard),
      label: 'Leaderboards',
    ),
    NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: destinations,
        selectedIndex: currentPageIndex,
        animationDuration: const Duration(milliseconds: 300),
        indicatorShape: const CircleBorder(),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: const Color(0xFF00FF00),
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: _getPage(currentPageIndex), // Add a method to switch pages
    );
  }

  // Method to return the appropriate page based on the selected index
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const LeadboardsScreen();
      case 1:
        return const HomeScreen();
      case 2:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}
