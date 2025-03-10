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
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 1,
  );

  List<NavigationDestination> get destinations => [
        NavigationDestination(
          icon: Icon(
            Icons.leaderboard,
            color: currentPageIndex == 0
                ? const Color.fromARGB(255, 0, 0, 0)
                : const Color.fromARGB(255, 255, 255, 255),
          ),
          label: 'Leaderboards',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.home,
            color: currentPageIndex == 1
                ? const Color.fromARGB(255, 0, 0, 0)
                : const Color.fromARGB(255, 255, 255, 255),
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person,
            color: currentPageIndex == 2
                ? const Color.fromARGB(255, 0, 0, 0)
                : const Color.fromARGB(255, 255, 255, 255),
          ),
          label: 'Profile',
        ),
      ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.transparent,
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
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            });
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/starsBackground.jpg"),
                opacity: 1,
                fit: BoxFit.cover,
              ),
            ),
          ),
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              children: const [
                LeadboardsScreen(),
                HomeScreen(),
                ProfileScreen(),
              ],
            ),
        ],
      ),
    );
  }
}
