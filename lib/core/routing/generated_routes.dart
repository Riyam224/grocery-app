import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/routing/app_routes.dart';
import 'package:grocery/features/auth/presentation/views/auth_welcome.dart';
import 'package:grocery/features/auth/presentation/views/signin_view.dart';
import 'package:grocery/features/auth/presentation/views/signup_view.dart';
import 'package:grocery/features/home/presentation/views/home_view.dart';
import 'package:grocery/features/onboarding/views/onboarding_view.dart';
import 'package:grocery/features/splash/views/splash_view.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('404 Not Found'))),
    initialLocation: AppRoutes.authWelcome,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),

      GoRoute(
        path: AppRoutes.singin,
        name: AppRoutes.singin,
        builder: (context, state) => const SigninView(),
      ),

      GoRoute(
        path: AppRoutes.singup,
        name: AppRoutes.singup,
        builder: (context, state) => const SignupView(),
      ),

      GoRoute(
        path: AppRoutes.authWelcome,
        name: AppRoutes.authWelcome,
        builder: (context, state) => const AuthWelcome(),
      ),
    ],
  );
}
