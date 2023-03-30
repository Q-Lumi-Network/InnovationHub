import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

import '../services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthBloc {
  final authService = AuthService();
  // final googleSignin = GoogleSignIn(scopes: ['email']);

  //Stream<User?>? get currentUser => authService.currentUser;

  // Register New User
  Future  registerWithEmailPassword(String email, String password) async {
  try {
    final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;

  } catch (e) {
    print(e.toString());
    return null;
  }
}

// Sign in with email & password
Future signInWithEmailPassword(String email, String password) async {
  try {
    final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;

  } catch (e) {
    print(e.toString());
    return null;
  }
}


  // Sign in Anonymously

  signInAnonymously() async {
    try {
      // Firebase Sign In Anonymously
      final result = await authService.signInAnonymously();

      return result;
      
    } catch (e) {print(e);}
  }

// Logout
logOut() {
    authService.logout();
  }

}
