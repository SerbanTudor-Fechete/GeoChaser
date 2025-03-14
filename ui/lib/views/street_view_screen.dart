import 'package:flutter/material.dart';

class StreetViewScreen extends StatefulWidget {
  const StreetViewScreen({super.key});

  @override
  State<StreetViewScreen> createState() => _StreetViewScreenState();
}

class _StreetViewScreenState extends State<StreetViewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Street View',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}