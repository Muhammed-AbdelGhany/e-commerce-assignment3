import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfoSection extends StatelessWidget {
  final int subtotal;
  final int shippingCost;

  const OrderInfoSection({
    super.key,
    required this.subtotal,
    this.shippingCost = 10,
  });

  @override
  Widget build(BuildContext context) {
    final total = subtotal + shippingCost;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Info',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1D1E20),
            ),
          ),
          SizedBox(height: 16.h),
          _buildInfoRow('Subtotal', '\$$subtotal'),
          SizedBox(height: 12.h),
          _buildInfoRow('Shipping cost', '\$$shippingCost'),
          SizedBox(height: 12.h),
          Divider(color: const Color(0xFFE7E8EA), thickness: 1),
          SizedBox(height: 12.h),
          _buildInfoRow(
            'Total',
            '\$$total',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: isBold ? const Color(0xFF1D1E20) : const Color(0xFF8F959E),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D1E20),
          ),
        ),
      ],
    );
  }
}
