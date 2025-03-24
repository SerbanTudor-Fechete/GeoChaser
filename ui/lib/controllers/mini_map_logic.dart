import 'package:flutter/material.dart';
import 'package:geo_chaser/controllers/current_location_logic.dart';
import 'package:geo_chaser/views/map_screen.dart';
import 'package:geo_chaser/models/page_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MiniMapLogic extends StatefulWidget {
  const MiniMapLogic({super.key});

  @override
  State<MiniMapLogic> createState() => _MiniMapLogicState();
}

class _MiniMapLogicState extends State<MiniMapLogic> {
  GoogleMapController? _mapController;
  LatLng? _currentLatLng;

  @override
  void initState() {
    super.initState();
    _loadCurrentLocation();
  }

   Future<void> _loadCurrentLocation() async {
    try {
      final location = await currentLocation();
      setState(() {
        _currentLatLng = location;
      });
      _mapController?.animateCamera(CameraUpdate.newLatLng(location));
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    if (_currentLatLng == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Stack(
      children: [
        IgnorePointer(
          ignoring: true,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _currentLatLng!,
              zoom: 16.0,
            ),
            compassEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              pageTransition(
                const MainMapScreen(),
              ),
            );
          },
        )
      ],
    );
  }
}
