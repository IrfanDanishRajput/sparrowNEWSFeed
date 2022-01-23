import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth;

  const AuthenticationRepository(this._auth);

  Future<bool> signInUserAnonymously() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    return userCredential.user != null;
  }
}
