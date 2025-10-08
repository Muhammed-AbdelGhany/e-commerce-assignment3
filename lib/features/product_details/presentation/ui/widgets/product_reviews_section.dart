import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/data/models/product_model.dart';

class ProductReviewsSection extends StatelessWidget {
  final ProductModel product;

  const ProductReviewsSection({
    super.key,
    required this.product,
  });

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
                'Reviews',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1D1E20),
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF8F959E),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildReviewItem(),
        ],
      ),
    );
  }

  Widget _buildReviewItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, color: Colors.grey[600], size: 28),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ronald Richards',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1D1E20),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC107),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      '${product.rating?.toStringAsFixed(1) ?? '4.8'} rating',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(Icons.access_time, size: 14.sp, color: const Color(0xFF8F959E)),
                  SizedBox(width: 4.w),
                  Text(
                    '13 Sep, 2020',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF8F959E),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < (product.rating?.round() ?? 4) ? Icons.star : Icons.star_border,
                    color: const Color(0xFFFFC107),
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: const Color(0xFF8F959E),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
