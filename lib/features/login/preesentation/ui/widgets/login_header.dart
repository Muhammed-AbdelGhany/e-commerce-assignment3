import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            padding: EdgeInsets.zero,
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          'Welcome',
          style: TextStyles.font28BlackBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          'Please enter your data to continue',
          style: TextStyles.font16GrayRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
