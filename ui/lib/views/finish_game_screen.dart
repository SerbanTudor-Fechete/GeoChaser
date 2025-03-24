import 'package:flutter/material.dart';
import 'package:geo_chaser/controllers/finish_map_logic.dart';

class FinishGameScreen extends StatefulWidget {
  const FinishGameScreen({super.key});

  @override
  State<FinishGameScreen> createState() => _FinishGameScreenState();
}

class _FinishGameScreenState extends State<FinishGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: <Widget>[
        FinishMapLogic(),
        Positioned(
          bottom: 20,
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: const Text('Back to home'),
          ),
        ),
      ]),
    );
  }
}
