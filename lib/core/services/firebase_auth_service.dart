import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/core/error/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  // todo
  Future<User> createUserWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in firebase auth service: $e');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'The account already exists for that email.',
        );
      } else if (e.code == 'network request timeout') {
        {
          throw CustomException(
            message: 'Network request timeout check the internet',
          );
        }
      } else {
        throw CustomException(message: e.toString());
      }
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  // todo

  Future<User> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // log('Exception in firebase auth service: $e'); // ✅ Logs the error
      debugPrint('Exception in firebase auth service: $e');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'Wrong password provided for that user.',
        );
      } else if (e.code == 'network request timeout') {
        {
          throw CustomException(
            message: 'Network request timeout check the internet',
          );
        }
      } else {
        throw CustomException(message: e.toString());
      }
    }
  }

  //  todo google
  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}

// // todo auth service general

// abstract class AuthService {}
