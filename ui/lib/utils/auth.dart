import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<String?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // No error means success
    } on FirebaseAuthException catch (e) {
      return e.message; // Return Firebase's error message
    } catch (e) {
      return "An unknown error occurred.";
    }
  }

  Future<String?> createUserWithEmail({
    required String email,
    required String password,
    required String userName,
  }) async {
    try{
      await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    _auth.currentUser!.updateDisplayName(userName);
    return   null;
    }on FirebaseAuthException catch (e) {
      return e.message; // Return Firebase's error message
    } catch (e) {
      return "An unknown error occurred.";
  }
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
