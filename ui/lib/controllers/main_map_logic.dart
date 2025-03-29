import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geo_chaser/controllers/current_location_logic.dart';

class MainMapLogic extends StatefulWidget {
  const MainMapLogic({super.key});

  @override
  State<MainMapLogic> createState() => _MainMapLogicState();
}

class _MainMapLogicState extends State<MainMapLogic> {
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

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _currentLatLng!,
        zoom: 16.0,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
