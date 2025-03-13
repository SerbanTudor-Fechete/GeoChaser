import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainMapLogic extends StatefulWidget {
  const MainMapLogic({super.key});

  @override
  State<MainMapLogic> createState() => _MainMapLogicState();
}

class _MainMapLogicState extends State<MainMapLogic> {
  late GoogleMapController mapController;

  final LatLng center = const LatLng(-33.86, 151.20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 11.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId('Sydney'),
              position: LatLng(-33.86, 151.20),
            )
          },
        ),
      ],
    );
  }
}