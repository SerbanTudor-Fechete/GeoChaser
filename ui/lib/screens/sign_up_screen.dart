import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geo_chaser/reusable_widgets/reusable_widgets.dart';
import 'package:geo_chaser/screens/home_screen.dart';
import 'package:geo_chaser/utils/colors_util.dart';
import 'package:geo_chaser/utils/auth.dart';
import 'package:http/http.dart' as https;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final Auth auth = Auth();
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  //method to handle sign up 
  Future<void> _handleSignUp() async {
  // Create the user with Firebase, passing email, password, and username.
  final errorMessage = await auth.createUserWithEmail(
    email: _emailTextController.text,
    password: _passwordTextController.text,
    userName: _userNameTextController.text,
  );

    if (!mounted) return;


  if (errorMessage == null) {
    // Retrieve the newly created Firebase user.
    final fireBaseUser = auth.currentUser;
    if (fireBaseUser == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Firebase user not found.")),
        );
      }
      return;
    }
    // Get the Firebase ID token and UID.
    final fireBaseIdToken = await fireBaseUser.getIdToken();
    final fireBaseUid = fireBaseUser.uid;

    // Use the username from the text field (you could also use fireBaseUser.displayName if set).
    final username = _userNameTextController.text;

    // Send the UID and username to your backend for registration.
    final response = await https.post(
      Uri.parse("http://192.168.1.130:8080/api/users/register"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $fireBaseIdToken',
      },
      body: jsonEncode({
        "firebaseUid": fireBaseUid,
        "username": username,
      }),
    );

    if(!mounted) return;
    if (response.statusCode == 200) {
      // Sign up successful, navigate to HomeScreen.
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } else {
      // Handle backend error response.
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Backend sign up failed.")),
        );
      }
    }
  } else {
    // Show the error message returned from Firebase.
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
           fontSize: 25,
            fontWeight: FontWeight.bold,
            ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("#FFA07A"),
            hexStringToColor("#FF6347"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: SingleChildScrollView(
            child:Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  reusableTextField("Enter username", Icons.person_outline, false, _userNameTextController),
                  const SizedBox(height: 20),
                  reusableTextField("Enter e-mail", Icons.person_outline, false, _emailTextController),
                  const SizedBox(height: 20),
                  reusableTextField("Enter password", Icons.lock_outline, true, _passwordTextController),
                  const SizedBox(height: 20),
                  signInSingUpButton(context, false, _handleSignUp),
                ],
              ),
            )
          )))
    );
  }
}