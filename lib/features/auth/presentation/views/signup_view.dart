import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/custom_widgets/custom_btn.dart';
import 'package:grocery/core/custom_widgets/custom_text_field.dart';
import 'package:grocery/core/helper_functions/custom_snackbar.dart';
import 'package:grocery/core/routing/app_routes.dart';
import 'package:grocery/core/services/get_it_service.dart';
import 'package:grocery/core/styling/app_colors.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';
import 'package:grocery/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:grocery/features/auth/presentation/cubit/signup/signup_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  GoRouter.of(context).go(AppRoutes.singin);
                }

                if (state is SignupFailure) {
                  showCustomSnackbar(context, state.message);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is SignupLoading ? true : false,
                  child: SignupViewBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// todo sign up body

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  // todo add formkey and other requirements

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password, phoneNumber;
  // todo
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/auth1.png', fit: BoxFit.cover),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // todo Form
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create account ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.75,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Quickly create account',
                    style: TextStyle(
                      color: const Color(0xFF868889),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.45,
                    ),
                  ),
                  SizedBox(height: 26),
                  CustomTextField(
                    obscureText: false,
                    onSaved: (value) {
                      email = value;
                    },
                    suffixIcon: const Icon(Icons.email_outlined),
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    obscureText: false,
                    onSaved: (value) {
                      phoneNumber = value;
                    },
                    suffixIcon: const Icon(Icons.phone_android_outlined),
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),

                  CustomTextField(
                    obscureText: true,
                    onSaved: (value) {
                      password = value;
                    },
                    suffixIcon: const Icon(Icons.lock_outline),
                    hintText: 'password',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 21),

                  CustomBtn(
                    color: AppColors.darkPrimaryColor,
                    text: 'Sign up',
                    onTap: () {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();

                        if (email != null &&
                            phoneNumber != null &&
                            password != null) {
                          context
                              .read<SignupCubit>()
                              .createUserWithEmailandPassword(
                                email: email!,
                                password: password!,
                                phoneNumber: phoneNumber!,
                              );
                        }
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 17),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(AppRoutes.singin);
                    },
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: const Color(0xFF868889),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.45,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.45,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign in',
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
