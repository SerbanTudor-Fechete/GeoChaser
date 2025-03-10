import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select Radius',
              style: TextStyle(fontSize: 30),
            ),
            SliderTheme(
              data: const SliderThemeData(
                activeTrackColor: Color.fromARGB(255, 255, 255, 255),
                inactiveTrackColor: Color.fromARGB(255, 0, 0, 0),
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 6.0,
                thumbColor: Color.fromARGB(255, 0, 0, 0),
               thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayColor: Color.fromARGB(255, 255, 255, 255),
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
                  const SizedBox(height: 20),
                  Text(
                    'Selected Range: ${selectedRange.start.round()} - ${selectedRange.end.round()}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StreetViewScreen(),
                        ),
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        }
      }