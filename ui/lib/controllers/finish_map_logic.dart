import 'package:flutter/material.dart';
import 'package:geo_chaser/controllers/coordinates.dart';
import 'package:geo_chaser/controllers/current_location_logic.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FinishMapLogic extends StatefulWidget {
  const FinishMapLogic({super.key});

  @override
  State<FinishMapLogic> createState() => _FinishMapLogicState();
}

class _FinishMapLogicState extends State<FinishMapLogic> {

  GoogleMapController? _mapController;
  LatLng? _currentLatLng;
  LatLng? _finishLatLng;
  Polyline? _polyline;

  @override
  void initState() {
    super.initState();
    _loadCurrentLocation();
    _loadFinishCoordinates();
}


Future<void> _loadFinishCoordinates() async {
    try {
      final coords = await fetchCoordinates(); 
      if (coords != null) {
        setState(() {
          _finishLatLng = LatLng(coords.lat, coords.lng);
        });
        _initPolyline(); 
        _updateCameraPosition(); 
      }
    } catch (e) {
      debugPrint("Error getting finish coordinates: $e");
    }
  }

  Future<void> _loadCurrentLocation() async {
    try {
      final location = await currentLocation();
      setState(() {
        _currentLatLng = location;
      });
      _initPolyline();
      _updateCameraPosition();
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
  }

  void _initPolyline() {
    _polyline = Polyline(
      polylineId: const PolylineId('finishLine'),
      color: Colors.red,
      width: 5,
      points: [
        _currentLatLng!,
        _finishLatLng!,
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _updateCameraPosition();
  }

  void _updateCameraPosition() {
    if (_currentLatLng != null && _mapController != null) {
      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          _currentLatLng!.latitude < _finishLatLng!.latitude
              ? _currentLatLng!.latitude
              : _finishLatLng!.latitude,
          _currentLatLng!.longitude < _finishLatLng!.longitude
              ? _currentLatLng!.longitude
              : _finishLatLng!.longitude,
        ),
        northeast: LatLng(
          _currentLatLng!.latitude > _finishLatLng!.latitude
              ? _currentLatLng!.latitude
              : _finishLatLng!.latitude,
          _currentLatLng!.longitude > _finishLatLng!.longitude
              ? _currentLatLng!.longitude
              : _finishLatLng!.longitude,
        ),
      );
      _mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentLatLng == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLatLng!,
                zoom: 16.0,
              ),
                markers: {
                Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                  markerId: MarkerId('currentLocation'),
                  position: _currentLatLng!,
                ),
                Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  markerId: MarkerId('finishLocation'),
                  position: _finishLatLng!,
                ),
                },
                polylines: _polyline != null ? <Polyline>{_polyline!} : <Polyline>{},
            ),
    );
  }
}
