import 'package:flutter/material.dart';
import 'package:geo_chaser/models/reusable_widgets.dart';
import 'package:geo_chaser/views/navbar_main.dart';
import 'package:geo_chaser/views/sign_up_screen.dart';
import 'package:geo_chaser/controllers/auth.dart';
import 'package:http/http.dart' as https;

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

  if (!mounted) return;

  if (errorMessage == null) {
    final fireBaseUser = auth.currentUser;
    if (fireBaseUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Firebase user not found.")),
        );
      return;
    }
    final fireBaseIdToken = await fireBaseUser.getIdToken();

    if (!mounted) return;

    final fireBaseUid = fireBaseUser.uid;

    //send the Uid to the backend
    final response = await https.get(
      Uri.parse("http://192.168.1.130:8080/api/users/$fireBaseUid"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer $fireBaseIdToken',
      },
    );

    if (!mounted) return;

    if(response.statusCode == 200){
      // Login successful, navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavBarMain()),
      );
    } else{
      // Handle backend error response.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Backend sign in failed.")),
        );
    }
  } else {
    // Log and show the error message
    if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
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
           Color.fromARGB(255, 255, 160, 122),
          Color.fromARGB(255, 255, 99, 71),
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
                  const SizedBox(height: 20),
                  reusableTextField("Enter password", Icons.lock_outline, true,
                      _passwordTextController),
                  const SizedBox(height: 20),
                  signInSingUpButton(context, true, _handleSignIn),
                  const SizedBox(height: 20),
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
