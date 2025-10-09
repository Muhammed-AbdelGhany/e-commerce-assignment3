import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/theming/styles.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';
import 'widgets/cart_app_bar.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/delivery_address_section.dart';
import 'widgets/payment_method_section.dart';
import 'widgets/order_info_section.dart';
import 'widgets/section_header.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CartAppBar(),
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (cartResponse) {
                      final subtotal = cartResponse.cartItems.fold<int>(
                        0,
                        (sum, item) => sum + item.totalPrice,
                      );

                      return Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Cart Items
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: cartResponse.cartItems.length,
                                    itemBuilder: (context, index) {
                                      return CartItemCard(
                                        item: cartResponse.cartItems[index],
                                      );
                                    },
                                  ),
                                  SizedBox(height: 16.h),
                                  // Delivery Address
                                  SectionHeader(
                                    title: 'Delivery Address',
                                    onTap: () {
                                      // TODO: Navigate to address selection
                                    },
                                  ),
                                  const DeliveryAddressSection(),
                                  SizedBox(height: 16.h),
                                  // Payment Method
                                  SectionHeader(
                                    title: 'Payment Method',
                                    onTap: () {
                                      // TODO: Navigate to payment method selection
                                    },
                                  ),
                                  const PaymentMethodSection(),
                                  SizedBox(height: 16.h),
                                  // Order Info
                                  OrderInfoSection(subtotal: subtotal),
                                  SizedBox(height: 100.h), // Space for button
                                ],
                              ),
                            ),
                          ),
                          // Checkout Button
                          AppTextButton(
                            buttonText: 'Checkout',
                            textStyle: TextStyles.font18WhiteSemiBold,
                            onPressed: () {
                              context.pushNamed(Routes.orderConfirmedScreen);
                            },
                            buttonHeight: 60.h,
                            borderRadius: 0,
                            backgroundColor: const Color(0xFF9775FA),
                          ),
                        ],
                      );
                    },
                    error: (errorHandler) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            errorHandler.apiErrorModel.message ??
                                'Error loading cart',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TextButton(
                            onPressed: () {
                              context.read<CartCubit>().getCart();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
