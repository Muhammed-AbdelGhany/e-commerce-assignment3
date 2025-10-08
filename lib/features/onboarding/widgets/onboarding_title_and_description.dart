import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';

class OnboardingTitleAndDescription extends StatelessWidget {
  const OnboardingTitleAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title - single line
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Look Good, Feel Good',
            style: TextStyles.font28BlackBold,
            maxLines: 1,
          ),
        ),

        SizedBox(height: 12.h),

        // Description
        Text(
          'Create your individual & unique style and look amazing everyday.',
          style: TextStyles.font16GrayRegular,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}
