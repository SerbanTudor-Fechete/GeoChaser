import 'package:flutter/material.dart';
import 'package:geo_chaser/views/radius_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/planets0.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 3.3,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(0, 0, 0, 0), // Background color
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RadiusScreen()));
            },
            child: const Text(
              'Start Game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
