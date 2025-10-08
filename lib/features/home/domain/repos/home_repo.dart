import 'package:ecommerce_assignment3/core/networking/api_result.dart';
import 'package:ecommerce_assignment3/features/home/data/models/category_model.dart';
import 'package:ecommerce_assignment3/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<ApiResult<CategoriesResponse>> getCategories();
  Future<ApiResult<ProductsResponse>> getProducts({
    String? searchTerm,
    String? category,
  });
}
