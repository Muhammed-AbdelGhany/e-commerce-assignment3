import 'package:dio/dio.dart';
import 'package:ecommerce_assignment3/core/networking/api_constants.dart';
import 'package:ecommerce_assignment3/features/home/data/models/category_model.dart';
import 'package:ecommerce_assignment3/features/home/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET('categories')
  Future<CategoriesResponse> getCategories();

  @GET('products')
  Future<ProductsResponse> getProducts(
    @Query('searchTerm') String? searchTerm,
    @Query('category') String? category,
  );
}
