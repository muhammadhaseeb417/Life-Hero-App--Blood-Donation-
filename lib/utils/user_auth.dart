import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  static final firebaseInstance = FirebaseAuth.instance;

  static signup(String email, String password) async {
    try {
      await firebaseInstance.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          log("The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          log("The account already exists for that email.");
        } else if (e.code == 'invalid-email') {
          log("The email address is badly formatted.");
        } else {
          log("Error: ${e.message}");
        }
      } else {
        log("Error: $e");
      }
      return false;
    }
  }

  static login(String email, String password) async {
    return true;
  }
}
