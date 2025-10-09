import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';
import 'widgets/product_details_app_bar.dart';
import 'widgets/product_details_content.dart';
import 'widgets/product_details_loading.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          state.maybeWhen(
            addToCartSuccess: (message) {
              AppSnackbar.showSuccess(context, message);
            },
            addToCartError: (errorHandler) {
              AppSnackbar.showError(
                context,
                errorHandler.apiErrorModel.message ?? 'Failed to add to cart',
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const ProductDetailsLoading(),
            success: (product, isAddingToCart) => SafeArea(
              child: Column(
                children: [
                  const ProductDetailsAppBar(),
                  Expanded(
                    child: ProductDetailsContent(
                      product: product,
                      isAddingToCart: isAddingToCart,
                    ),
                  ),
                ],
              ),
            ),
            error: (errorHandler) => Center(
              child: Text(errorHandler.apiErrorModel.message ?? 'Error'),
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
