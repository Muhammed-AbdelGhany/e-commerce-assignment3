import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPersonImage extends StatelessWidget {
  const OnboardingPersonImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/man.png',
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 300.w,
          height: 500.h,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Icon(
            Icons.person,
            size: 150.sp,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
