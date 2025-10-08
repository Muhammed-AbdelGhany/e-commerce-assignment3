import 'package:flutter/material.dart';

class OnboardingBackground extends StatelessWidget {
  final Widget child;

  const OnboardingBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFB8A9E8), // Light purple
            Color(0xFFA89DE0), // Medium purple
            Color(0xFF9B8CD8), // Darker purple
          ],
        ),
      ),
      child: child,
    );
  }
}
