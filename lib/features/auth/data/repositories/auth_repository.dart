// repositories/auth_repository.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signUp(
      String email, String password, String username) async {
    final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Save username to Firestore under "users" collection
    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'username': username,
      'email': email, // Storing email for reference
    });

    return userCredential;
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final UserCredential userCredential =
        await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userDoc = await _firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();

    if (userDoc.exists) {
      return userDoc.data(); // Returns {'username': username, 'email': email}
    } else {
      return null; // Handle if user document doesn't exist
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
