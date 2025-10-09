import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../home/data/models/product_model.dart';
import '../../cubit/product_details_cubit.dart';
import '../../cubit/product_details_state.dart';

class ProductBottomBar extends StatelessWidget {
  final ProductModel product;
  final bool isAddingToCart;

  const ProductBottomBar({
    super.key,
    required this.product,
    this.isAddingToCart = false,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = (product.price ?? 120) * 1.05; // Adding VAT (5%)

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: const Color(0xFF1D1E20),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'with VAT,SD',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: const Color(0xFF8F959E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1D1E20),
                  ),
                ),
              ],
            ),
          ),
          AppTextButton(
            buttonText: 'Add to Cart',
            textStyle: TextStyles.font18WhiteSemiBold,
            onPressed: () {
              if (!isAddingToCart) {
                context.read<ProductDetailsCubit>().addToCart(product.id!);
              }
            },
            buttonHeight: 54.h,
            borderRadius: 0,
            backgroundColor: const Color(0xFF9775FA),
            isLoading: isAddingToCart,
          ),
        ],
      ),
    );
  }
}
