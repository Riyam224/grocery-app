import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:grocery/core/error/custom_exceptions.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/core/services/firebase_auth_service.dart';
import 'package:grocery/core/services/firestore_service.dart';
import 'package:grocery/core/utils/backend_endpoints.dart';
import 'package:grocery/features/auth/data/models/user_model.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    // todo from database firestore
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailandPassword(
    String email,
    String password,
    String? phoneNumber,
  ) async {
    // todo to check
    User? user;

    try {
      user = await firebaseAuthService.createUserWithEmailandPassword(
        email: email,
        password: password,
      );
      // todo edit here to store user in firestore
      // todo here need the user entity comes from input user data not from firebase
      var userEntity = UserEntity(
        uId: user.uid,
        email: email,
        phoneNumber: user.phoneNumber!,
      );
      await addData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      // todo check if user is not null . means the user created , delete it
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      // todo do the same here
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return Left(ServerFailure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailandPassword(
        email: email,
        password: password,
      );

      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure('Something went wrong'));
    }
  }

  // todo add Data

  @override
  Future addData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUser,
      // todo from userEntity
      data: user.toMap(),
    );
  }
}
