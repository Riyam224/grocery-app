import 'package:flutter/material.dart';
import 'package:grocery/features/onboarding/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnboardingViewBody());
  }
}
