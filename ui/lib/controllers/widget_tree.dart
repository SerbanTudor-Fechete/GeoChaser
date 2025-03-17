import 'package:geo_chaser/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:geo_chaser/views/sign_in_screen.dart';
import 'package:geo_chaser/views/navbar_main.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
     stream: _auth.authStateChanges,
     builder: (context, snaphot){

    if (snaphot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

     if (snaphot.hasData) {
        return const NavBarMain();
     } else {
       return const SignInScreen();
     }
     }
     );
  }
}
