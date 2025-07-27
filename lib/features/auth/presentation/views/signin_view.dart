import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/custom_widgets/custom_btn.dart';
import 'package:grocery/core/custom_widgets/custom_text_field.dart';
import 'package:grocery/core/routing/app_routes.dart';
import 'package:grocery/core/styling/app_colors.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/auth2.png', fit: BoxFit.cover),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back !',
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
                  'Sign in to your account',
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
                  onSaved: (value) {},
                  suffixIcon: const Icon(Icons.email_outlined),
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),

                CustomTextField(
                  obscureText: true,
                  onSaved: (value) {},
                  suffixIcon: const Icon(Icons.lock_outline),
                  hintText: 'password',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 21),
                Row(
                  children: [
                    SizedBox(
                      width: 29,
                      height: 16,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(
                                  side: BorderSide(
                                    width: 1.50,
                                    color: const Color(0xFF868889),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        color: const Color(0xFF868889),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.45,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17),
                CustomBtn(
                  color: AppColors.darkPrimaryColor,
                  text: 'Sign In',
                  onTap: () {},
                ),
                SizedBox(height: 17),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go(AppRoutes.singup);
                  },
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don’t have an account ?',
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
                            text: 'Sign up',
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
        ],
      ),
    );
  }
}
