import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
Stream<User?> authChanges() {
    return _auth.authStateChanges();
  }
  // Login Method
  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print('Login failed: $e');
      return null;
    }
  }
// sign in method
  Future<User?> signUp(String email, String password) async {
  try {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    return result.user;
  } catch (e) {
    print('Signup failed: $e');
    return null;
  }
}


  // Optional: check current user
  User? get currentUser => _auth.currentUser;
}
