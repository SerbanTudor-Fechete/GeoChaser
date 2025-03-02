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

  List<NavigationDestination> get destinations => [
    NavigationDestination(
      icon: Icon(Icons.leaderboard, color: currentPageIndex == 0 ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 255, 255, 255),),
      label: 'Leaderboards',
    ),
    NavigationDestination(
      icon: Icon(Icons.home, color: currentPageIndex == 1 ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 255, 255, 255),),
      label: 'Home',
    ),
   NavigationDestination(
      icon: Icon(Icons.person, color: currentPageIndex == 2 ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 255, 255, 255),),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: const Color.fromARGB(255, 255, 255, 255),
          labelTextStyle: WidgetStateProperty.all(
              const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        ),
        child: NavigationBar(
          destinations: destinations,
          backgroundColor: const Color(0X00FFFFFF),
          selectedIndex: currentPageIndex,
          animationDuration: const Duration(milliseconds: 300),
          indicatorShape: const CircleBorder(),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
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
