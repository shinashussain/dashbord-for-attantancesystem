import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> createUser(String email, String password) async {
    _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
