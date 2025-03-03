import 'package:flutter/material.dart';
import 'package:geo_chaser/reusable_widgets/reusable_widgets.dart';
import 'package:geo_chaser/screens/home_screen.dart';
import 'package:geo_chaser/screens/sign_up_screen.dart';
import 'package:geo_chaser/utils/colors_util.dart';
import 'package:geo_chaser/utils/auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final Auth auth = Auth();

  Future<void> _handleSignIn() async {
  final errorMessage = await auth.signInWithEmail(
    email: _emailTextController.text,
    password: _passwordTextController.text,
  );

  if (errorMessage == null) {
    // Login successful, navigate to HomeScreen
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  } else {
    // Log and show the error message
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.1, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/earth_logo.png"),
                  const SizedBox(height: 30),
                  reusableTextField("Enter e-mail", Icons.person_outline, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSingUpButton(context, true, _handleSignIn),
                  const SizedBox(
                    height: 20,
                  ),
                  signUpOption(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
