import 'package:flutter/material.dart';
import 'package:geo_chaser/controllers/main_map_logic.dart';

class MainMapScreen extends StatefulWidget {
  const MainMapScreen({super.key});

  @override
  State<MainMapScreen> createState() => _MainMapScreenState();
}

class _MainMapScreenState extends State<MainMapScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainMapLogic(),
      ),
    );
  }
}