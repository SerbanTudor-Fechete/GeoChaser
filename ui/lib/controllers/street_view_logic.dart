import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geo_chaser/controllers/current_location_logic.dart';


class StreetViewLogic extends StatefulWidget {
  const StreetViewLogic({super.key});

  @override
  State<StreetViewLogic> createState() => _StreetViewLogicState();
}

class _StreetViewLogicState extends State<StreetViewLogic> {
  late final WebViewController _controller;


  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
       _loadCurrentLocation();
  }

   Future<void> _loadCurrentLocation() async {
    try {
      final location = await currentLocation();
      setState(() {
      });
      // Once we have the location, build the URL with query parameters.
      final url = "http://192.168.1.130:8080/api/streetview?latitude=${location.latitude}&longitude=${location.longitude}";
      _controller.loadRequest(Uri.parse(url));
    } catch (e) {
      debugPrint("Error getting location: $e");
    }
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(controller: _controller),
    );
  }
}
