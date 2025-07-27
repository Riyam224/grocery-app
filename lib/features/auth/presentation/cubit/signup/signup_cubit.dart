import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';
import 'package:grocery/features/auth/presentation/cubit/signup/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailandPassword({
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailandPassword(
      email,
      password,
      phoneNumber,
    );
    result.fold(
      (failure) => emit(SignupFailure(failure, message: '')),
      (userEntity) => emit(SignupSuccess(userEntity)),
    );
  }
}
