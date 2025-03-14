import 'package:flutter/material.dart';

class LoadingScreenModel extends StatefulWidget {
  const LoadingScreenModel({super.key});

  @override
  State<LoadingScreenModel> createState() => _LoadingScreenModelState();
}

class _LoadingScreenModelState extends State<LoadingScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}