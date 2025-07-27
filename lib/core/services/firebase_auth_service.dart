import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/core/error/custom_exceptions.dart';

class FirebaseAuthService {
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
}

// // todo auth service general

// abstract class AuthService {}
