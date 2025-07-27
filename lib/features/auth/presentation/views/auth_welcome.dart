import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/custom_widgets/custom_social_btn.dart';
import 'package:grocery/core/routing/app_routes.dart';
import 'package:grocery/core/styling/app_colors.dart';

class AuthWelcome extends StatelessWidget {
  const AuthWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  onTap: () {},
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
      ),
    );
  }
}
