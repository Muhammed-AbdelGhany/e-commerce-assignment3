import 'package:ecommerce_assignment3/features/login/preesentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/forgot_password_and_remember_me.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/login_form_fields.dart';
import 'widgets/login_header.dart';
import 'widgets/terms_and_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Form(
                  key: context.read<LoginCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const LoginHeader(),
                      SizedBox(height: 48.h),
                      const LoginFormFields(),
                      SizedBox(height: 12.h),
                      const ForgotPasswordAndRememberMe(),
                    ],
                  ),
                ),
              ),
            ),
            // Terms and button at the bottom
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: const TermsAndLoginButton(),
            ),
            const LoginBlocListener(),
          ],
        ),
      ),
    );
  }
}
