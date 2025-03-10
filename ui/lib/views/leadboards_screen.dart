import 'package:flutter/material.dart';

class LeadboardsScreen extends StatelessWidget {
  const LeadboardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/planets1.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}