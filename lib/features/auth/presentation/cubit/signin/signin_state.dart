import 'package:flutter/material.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess(this.userEntity);
}

final class SigninFailure extends SigninState {
  final String message;
  SigninFailure(Failure l, {required this.message});
}
