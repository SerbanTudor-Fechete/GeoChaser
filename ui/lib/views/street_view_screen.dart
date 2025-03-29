import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geo_chaser/controllers/mini_map_logic.dart';
import 'package:geo_chaser/controllers/street_view_logic.dart';
import 'package:geo_chaser/views/finish_game_screen.dart';

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
          StreetViewLogic(),
          Align(
            alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(bottom: 20.h, left: 20.w),
                width: 170.w,
                height: 150.h,
                child: MiniMapLogic(),
              ),
            ),
            Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h, right: 20.w),
              child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                icon: Icon(Icons.home, size: 40.w, color: Colors.blue,),
                onPressed: () {
                     Navigator.of(context).popUntil((route) => route.isFirst);
                },
                ),
                SizedBox(width: 20.w),
                IconButton(
                icon: Icon(Icons.flag, size: 40.w, color: Colors.blue,),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FinishGameScreen(),
                  ),
                  );
                },
                ),
              ],
            ),
          ),
        ),
        ],  
      ),
    );
  }
}