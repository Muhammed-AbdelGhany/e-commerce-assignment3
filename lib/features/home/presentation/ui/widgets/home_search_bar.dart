import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onMicTap;

  const HomeSearchBar({
    super.key,
    required this.controller,
    this.onChanged,
    this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Icon(
                    Icons.search,
                    color: const Color(0xFF8F959E),
                    size: 20.sp,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        color: const Color(0xFF8F959E),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          height: 50.h,
          width: 50.h,
          decoration: BoxDecoration(
            color: ColorsManager.mainPurple,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(
            Icons.mic_none,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
