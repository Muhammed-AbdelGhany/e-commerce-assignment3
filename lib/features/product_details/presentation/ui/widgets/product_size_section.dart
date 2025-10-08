import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSizeSection extends StatefulWidget {
  const ProductSizeSection({super.key});

  @override
  State<ProductSizeSection> createState() => _ProductSizeSectionState();
}

class _ProductSizeSectionState extends State<ProductSizeSection> {
  String _selectedSize = 'M';
  final List<String> _sizes = ['S', 'M', 'L', 'XL', '2XL'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Size',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D1E20),
                ),
              ),
              Text(
                'Size Guide',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF8F959E),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: _sizes.map((size) => _buildSizeButton(size)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    final isSelected = _selectedSize == size;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        width: 60.w,
        height: 60.h,
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFF1D1E20),
            ),
          ),
        ),
      ),
    );
  }
}
