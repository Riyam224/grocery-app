import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/routing/app_routes.dart';
import 'package:grocery/core/styling/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  void navigateTo() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).go(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          'Welcome',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            height: 1.30,
            letterSpacing: 0.90,
          ),
        ),
      ),
    );
  }
}
