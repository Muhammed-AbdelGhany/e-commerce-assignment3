import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: TextStyles.font16GrayRegular,
        ),
        SizedBox(height: 4.h),
        Text(
          'Welcome to Laza',
          style: TextStyles.font28BlackBold,
        ),
      ],
    );
  }
}
