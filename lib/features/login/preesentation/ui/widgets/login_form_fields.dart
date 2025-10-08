import 'package:ecommerce_assignment3/features/login/preesentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class LoginFormFields extends StatefulWidget {
  const LoginFormFields({super.key});

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Username field
        AppTextFormField(
          labelText: 'Username',
          hintText: 'Esther Howard',
          controller: context.read<LoginCubit>().emailController,
          showValidationIcon: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
        ),

        SizedBox(height: 24.h),

        // Password field
        AppTextFormField(
          labelText: 'Password',
          hintText: '••••••••',
          controller: context.read<LoginCubit>().passwordController,
          isObscureText: isObscureText,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            child: Icon(
              isObscureText ? Icons.visibility_off : Icons.visibility,
              color: ColorsManager.gray,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 8) {
              return 'Password must be at least 8 characters';
            }
            return null;
          },
        ),

        SizedBox(height: 8.h),

        // Password strength indicator
        ValueListenableBuilder(
          valueListenable: context.read<LoginCubit>().passwordController,
          builder: (context, value, child) {
            if (value.text.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: EdgeInsets.only(left: 4.w, top: 4.h),
              child: Row(
                children: [
                  Text(
                    'Strong',
                    style: TextStyles.font12GrayRegular.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
