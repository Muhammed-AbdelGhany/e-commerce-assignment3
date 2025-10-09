import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F6FA),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF1D1E20),
                    ),
                  ),
                ),
              ),
            ),
            // Content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Illustration
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background circles
                      Container(
                        width: 300.w,
                        height: 300.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFF5F6FA),
                            width: 2,
                          ),
                        ),
                      ),
                      Container(
                        width: 250.w,
                        height: 250.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFF5F6FA),
                            width: 2,
                          ),
                        ),
                      ),
                      // Phone illustration
                      Column(
                        children: [
                          Container(
                            width: 140.w,
                            height: 280.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(
                                color: const Color(0xFF2C2D3E),
                                width: 6,
                              ),
                            ),
                            child: Column(
                              children: [
                                // Notch
                                Container(
                                  margin: EdgeInsets.only(top: 8.h),
                                  width: 60.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2C2D3E),
                                    borderRadius: BorderRadius.circular(3.r),
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                // Checkmark
                                Container(
                                  width: 80.w,
                                  height: 80.h,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF9775FA),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 50.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Base
                          Container(
                            width: 80.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFF9775FA),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ],
                      ),
                      // Decorative leaves
                      Positioned(
                        top: 80.h,
                        left: 40.w,
                        child: Transform.rotate(
                          angle: -0.5,
                          child: Icon(
                            Icons.eco,
                            size: 24.sp,
                            color: const Color(0xFF2C2D3E),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.h,
                        right: 30.w,
                        child: Transform.rotate(
                          angle: 0.3,
                          child: Icon(
                            Icons.eco,
                            size: 28.sp,
                            color: const Color(0xFF9775FA),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  // Title
                  Text(
                    'Order Confirmed!',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1D1E20),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      'Your order has been confirmed, we will send you confirmation email shortly.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF8F959E),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Buttons
            Column(
              children: [
                // Go to Orders Button
                AppTextButton(
                  buttonText: 'Go to Orders',
                  textStyle: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D1E20),
                  ),
                  onPressed: () {
                    // TODO: Navigate to orders screen
                  },
                  buttonHeight: 60.h,
                  borderRadius: 30.r,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 12.h),
                // Continue Shopping Button
                AppTextButton(
                  buttonText: 'Continue Shopping',
                  textStyle: TextStyles.font18WhiteSemiBold,
                  buttonHeight: 60.h,
                  onPressed: () {
                    // Navigate back to home
                    context.pushNamedAndRemoveUntil(
                      Routes.homeScreen,
                      predicate: (route) => false,
                    );
                  },
                  borderRadius: 0.r,
                  backgroundColor: const Color(0xFF9775FA),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
