import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ForgotPasswordAndRememberMe extends StatefulWidget {
  const ForgotPasswordAndRememberMe({super.key});

  @override
  State<ForgotPasswordAndRememberMe> createState() =>
      _ForgotPasswordAndRememberMeState();
}

class _ForgotPasswordAndRememberMeState
    extends State<ForgotPasswordAndRememberMe> {
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Forgot Password
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Handle forgot password
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Forgot password?',
              style: TextStyles.font14GrayRegular.copyWith(
                color: const Color(0xFFFF4D67),
              ),
            ),
          ),
        ),

        SizedBox(height: 16.h),

        // Remember me
        Row(
          children: [
            Text(
              'Remember me',
              style: TextStyles.font14DarkBlueMedium.copyWith(
                color: ColorsManager.textDark,
              ),
            ),
            const Spacer(),
            Switch(
              value: rememberMe,
              onChanged: (value) {
                setState(() {
                  rememberMe = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorsManager.mainPurple,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: ColorsManager.lighterGray,
            ),
          ],
        ),
      ],
    );
  }
}
