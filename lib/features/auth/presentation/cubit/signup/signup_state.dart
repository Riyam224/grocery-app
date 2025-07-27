import 'package:flutter/material.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess(this.userEntity);
}

final class SignupFailure extends SignupState {
  final String message;
  SignupFailure(Failure l, {required this.message});
}
