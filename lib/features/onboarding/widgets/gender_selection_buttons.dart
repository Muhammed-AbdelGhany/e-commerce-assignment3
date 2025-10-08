import 'package:ecommerce_assignment3/core/helpers/extensions.dart';
import 'package:ecommerce_assignment3/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class GenderSelectionButtons extends StatelessWidget {
  const GenderSelectionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Men button
            Expanded(
              child: _GenderButton(
                label: 'Men',
                isPrimary: false,
                onTap: () {
                  context.pushNamed(Routes.loginScreen);
                },
              ),
            ),
            SizedBox(width: 12.w),
            // Women button
            Expanded(
              child: _GenderButton(
                label: 'Women',
                isPrimary: true,
                onTap: () {
                  context.pushNamed(Routes.loginScreen);
                },
              ),
            ),
          ],
        ),

        SizedBox(height: 4.h),

        // Skip button
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.loginScreen);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8.h),
          ),
          child: Text(
            'Skip',
            style: TextStyles.font16GrayMedium,
          ),
        ),
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  const _GenderButton({
    required this.label,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          color: isPrimary
              ? ColorsManager.mainPurple
              : ColorsManager.moreLighterGray,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Text(
            label,
            style: isPrimary
                ? TextStyles.font18WhiteSemiBold
                : TextStyles.font16GrayMedium,
          ),
        ),
      ),
    );
  }
}
