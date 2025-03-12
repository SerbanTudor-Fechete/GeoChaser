import 'package:flutter/material.dart';
import 'package:geo_chaser/screens/sign_in_screen.dart';
import 'package:geo_chaser/utils/auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Auth auth = Auth();

  Future <void> signOut() async {
    await auth.signOut();

    if (!mounted) return;
    
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: signOut,
          child:const Text("Sign Out"),
        ),
      ),
        );
  }
}