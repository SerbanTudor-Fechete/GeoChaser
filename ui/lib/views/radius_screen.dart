import 'package:flutter/material.dart';
import 'package:geo_chaser/controllers/current_location_logic.dart';
import 'package:geo_chaser/views/street_view_screen.dart';

class RadiusScreen extends StatefulWidget {
  const RadiusScreen({super.key});

  @override
  State<RadiusScreen> createState() => _RadiusScreenState();
}

class _RadiusScreenState extends State<RadiusScreen> {
  RangeValues selectedRange = const RangeValues(100, 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: SliderTheme(
              data: const SliderThemeData(
                activeTrackColor: Color.fromARGB(255, 0, 140, 255),
                inactiveTrackColor: Color.fromARGB(255, 200, 200, 200),
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 6.0,
                thumbColor: Color.fromARGB(255, 0, 140, 255),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayColor: Color.fromARGB(50, 0, 140, 255),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              ),
              child: RangeSlider(
                min: 100,
                max: 1000,
                divisions: 9,
                values: selectedRange,
                onChanged: (RangeValues newRange) {
                  setState(() {
                    selectedRange = newRange;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 140, 255), // Background color
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {
                currentLocationLogic();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StreetViewScreen(),
                  ),
                );
              },
              child: const Text(
                'Start Game',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}