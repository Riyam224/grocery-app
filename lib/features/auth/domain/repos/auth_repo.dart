import 'package:dartz/dartz.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailandPassword(
    final String email,
    final String password,
    final String? phoneNumber,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailandPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  // todo add data method in firestore

  Future addData({required UserEntity user});
  // todo get user data
  Future<UserEntity> getUserData({required String uId});
}
