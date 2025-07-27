import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/custom_widgets/custom_social_btn.dart';
import 'package:grocery/core/helper_functions/custom_snackbar.dart';
import 'package:grocery/core/routing/app_routes.dart';
import 'package:grocery/core/services/get_it_service.dart';
import 'package:grocery/core/styling/app_colors.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';
import 'package:grocery/features/auth/presentation/cubit/signin/signin_cubit.dart';
import 'package:grocery/features/auth/presentation/cubit/signin/signin_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AuthWelcome extends StatelessWidget {
  const AuthWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>(), googleSignIn: null),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return BlocConsumer<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SigninSuccess) {
                  GoRouter.of(context).go(AppRoutes.home);
                }

                if (state is SigninFailure) {
                  showCustomSnackbar(context, state.message);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is SigninLoading ? true : false,
                  child: AuthWelcomeBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// TODO

class AuthWelcomeBody extends StatelessWidget {
  const AuthWelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/auth1.png', fit: BoxFit.cover),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CustomSocialBtn(
                text: 'Continue with Google',
                image: 'assets/images/google.png',
                color: AppColors.bgColor2,
                onTap: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
              ),
              SizedBox(height: 10),
              CustomSocialBtn(
                text: 'Continue with Email',
                image: 'assets/images/user.png',
                color: AppColors.primaryColor,
                onTap: () {
                  GoRouter.of(context).go(AppRoutes.singin);
                },
              ),

              SizedBox(height: 10),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account ? ',
                        style: TextStyle(
                          color: const Color(0xFF868889),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.45,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
