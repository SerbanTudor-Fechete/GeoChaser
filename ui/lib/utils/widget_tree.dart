import 'package:geo_chaser/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:geo_chaser/screens/sign_in_screen.dart';
import 'package:geo_chaser/screens/home_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
     stream: Auth().authStateChanges,
     builder: (context, snaphot){
     if (snaphot.hasData) {
       return const HomeScreen();
     } else {
       return const SignInScreen();
     }
     }
     );
  }
}
