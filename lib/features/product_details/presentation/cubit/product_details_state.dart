import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../home/data/models/product_model.dart';

part 'product_details_state.freezed.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = _Initial;
  const factory ProductDetailsState.loading() = Loading;
  const factory ProductDetailsState.success(
    ProductModel product, {
    @Default(false) bool isAddingToCart,
  }) = Success;
  const factory ProductDetailsState.error(ErrorHandler errorHandler) = Error;
  const factory ProductDetailsState.addToCartSuccess(String message) = AddToCartSuccess;
  const factory ProductDetailsState.addToCartError(ErrorHandler errorHandler) = AddToCartError;
}
