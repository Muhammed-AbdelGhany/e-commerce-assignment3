import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/gender_selection_buttons.dart';
import 'widgets/onboarding_background.dart';
import 'widgets/onboarding_content_card.dart';
import 'widgets/onboarding_person_image.dart';
import 'widgets/onboarding_title_and_description.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBackground(
        child: SafeArea(
          child: Stack(
            children: [
              // Person image positioned to extend behind white box
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 180.h,
                child: const Center(
                  child: OnboardingPersonImage(),
                ),
              ),

              // White rounded container at bottom
              Positioned(
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
                child: OnboardingContentCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const OnboardingTitleAndDescription(),
                      SizedBox(height: 24.h),
                      const GenderSelectionButtons(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
