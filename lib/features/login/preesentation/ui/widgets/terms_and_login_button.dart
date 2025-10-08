import 'package:ecommerce_assignment3/features/login/preesentation/cubit/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';

class TermsAndLoginButton extends StatelessWidget {
  const TermsAndLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Terms and condition text
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By connecting your account confirm that you agree\nwith our ',
                style: TextStyles.font12GrayRegular.copyWith(
                  color: ColorsManager.gray,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: 'Term and Condition',
                style: TextStyles.font12GrayRegular.copyWith(
                  color: ColorsManager.textDark,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle terms tap
                  },
              ),
            ],
          ),
        ),

        SizedBox(height: 24.h),

        // Login button
        AppTextButton(
          buttonText: "Login",
          textStyle: TextStyles.font18WhiteSemiBold,
          onPressed: () {
            validateThenDoLogin(context);
          },
        ),
      ],
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
