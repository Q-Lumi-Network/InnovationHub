import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithCredential(AuthCredential credential) =>
      _auth.signInWithCredential(credential);

  Future<void> logout() => _auth.signOut();

  Future<UserCredential> signInAnonymously() => _auth.signInAnonymously();

  Stream<User?> get currentUser => _auth.authStateChanges();

  
}