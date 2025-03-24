import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    // Initialize the WebViewController and load the URL with hardcoded parameters.
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // Load the server endpoint with hardcoded coordinates and radius.
      ..loadRequest(Uri.parse(
          "http://192.168.1.130:8080/api/streetview"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(controller: _controller),
    );
  }
}
