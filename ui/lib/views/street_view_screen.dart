import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geo_chaser/controllers/mini_map_logic.dart';

class StreetViewScreen extends StatefulWidget {
  const StreetViewScreen({super.key});

  @override
  State<StreetViewScreen> createState() => _StreetViewScreenState();
}

class _StreetViewScreenState extends State<StreetViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(bottom: 20.h, left: 20.w),
                width: 170.w,
                height: 150.h,
                child: MiniMapLogic(),
              ),
            ),
          Center(
            child: Text(
              'Street View',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}