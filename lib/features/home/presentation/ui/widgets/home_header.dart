import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
        ),
        GestureDetector(
          onTap: () => context.pushNamed(Routes.cartScreen),
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: const Color(0xFF1D1E20),
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
