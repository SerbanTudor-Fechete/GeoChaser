import 'package:flutter/material.dart';

class LeadboardsScreen extends StatelessWidget {
  const LeadboardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Leadboards", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}