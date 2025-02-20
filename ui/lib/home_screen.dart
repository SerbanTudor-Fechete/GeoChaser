import 'package:flutter/material.dart';
import 'package:geo_chaser/navbar_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello World!", style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: NavBarMain(),
    );
  }
}