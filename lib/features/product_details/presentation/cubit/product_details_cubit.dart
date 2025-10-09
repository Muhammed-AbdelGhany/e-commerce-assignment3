import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/product_model.dart';
import '../../domain/repos/product_details_repo.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _productDetailsRepo;
  ProductModel? _currentProduct;

  ProductDetailsCubit(this._productDetailsRepo)
      : super(const ProductDetailsState.initial());

  void getProductDetails(String productId) async {
    emit(const ProductDetailsState.loading());
    final response = await _productDetailsRepo.getProductDetails(productId);
    response.when(
      success: (product) {
        _currentProduct = product;
        emit(ProductDetailsState.success(product));
      },
      failure: (errorHandler) {
        emit(ProductDetailsState.error(errorHandler));
      },
    );
  }

  void addToCart(String productId) async {
    if (_currentProduct == null) return;

    // Show loading on button while keeping product visible
    emit(ProductDetailsState.success(_currentProduct!, isAddingToCart: true));

    final response = await _productDetailsRepo.addToCart(productId);
    response.when(
      success: (addToCartResponse) {
        emit(ProductDetailsState.addToCartSuccess(addToCartResponse.message));
        // Restore the product details screen after showing the success message
        emit(ProductDetailsState.success(_currentProduct!, isAddingToCart: false));
      },
      failure: (errorHandler) {
        emit(ProductDetailsState.addToCartError(errorHandler));
        // Restore the product details screen after showing the error message
        emit(ProductDetailsState.success(_currentProduct!, isAddingToCart: false));
      },
    );
  }
}
