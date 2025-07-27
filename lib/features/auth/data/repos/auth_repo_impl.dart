
import 'package:dartz/dartz.dart';
import 'package:grocery/core/error/custom_exceptions.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/core/services/firebase_auth_service.dart';
import 'package:grocery/features/auth/data/models/user_model.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailandPassword(
    String email,
    String password,
    String phoneNumber,
  ) async {
    // todo to check

    try {
      var user = await firebaseAuthService.createUserWithEmailandPassword(
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
}
