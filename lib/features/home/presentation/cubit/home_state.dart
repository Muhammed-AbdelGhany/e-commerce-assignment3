import 'package:ecommerce_assignment3/core/networking/api_error_handler.dart';
import 'package:ecommerce_assignment3/features/home/data/models/category_model.dart';
import 'package:ecommerce_assignment3/features/home/data/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.categoriesLoaded(List<CategoryModel> categories) =
      CategoriesLoaded;

  const factory HomeState.productsLoaded(List<ProductModel> products) =
      ProductsLoaded;

  const factory HomeState.categoriesAndProductsLoaded({
    required List<CategoryModel> categories,
    required List<ProductModel> products,
  }) = CategoriesAndProductsLoaded;

  const factory HomeState.error(ErrorHandler errorHandler) = Error;
}
