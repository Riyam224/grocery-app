import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';
import 'package:grocery/features/auth/presentation/cubit/signin/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo, {required googleSignIn}) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailandPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SigninFailure(failure, message: '')),
      (userEntity) => emit(SigninSuccess(userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SigninFailure(failure, message: '')),
      (userEntity) => emit(SigninSuccess(userEntity)),
    );
  }
}
