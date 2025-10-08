import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/product_details_repo.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepo _productDetailsRepo;

  ProductDetailsCubit(this._productDetailsRepo)
      : super(const ProductDetailsState.initial());

  void getProductDetails(String productId) async {
    emit(const ProductDetailsState.loading());
    final response = await _productDetailsRepo.getProductDetails(productId);
    response.when(
      success: (product) {
        emit(ProductDetailsState.success(product));
      },
      failure: (errorHandler) {
        emit(ProductDetailsState.error(errorHandler));
      },
    );
  }
}
