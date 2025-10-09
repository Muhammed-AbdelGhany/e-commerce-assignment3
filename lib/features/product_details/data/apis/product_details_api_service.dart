import 'package:dio/dio.dart';
import 'package:ecommerce_assignment3/core/networking/api_constants.dart';
import 'package:ecommerce_assignment3/features/product_details/data/apis/product_details_api_endpoints.dart';
import 'package:ecommerce_assignment3/features/product_details/data/models/add_to_cart_request.dart';
import 'package:ecommerce_assignment3/features/product_details/data/models/add_to_cart_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../home/data/models/product_model.dart';

part 'product_details_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProductDetailsApiService {
  factory ProductDetailsApiService(Dio dio) =
      _ProductDetailsApiService;

  @GET(ProductDetailsApiEndpoints.productDetails)
  Future<ProductModel> getProductDetails(@Path('id') String id);

  @POST(ProductDetailsApiEndpoints.addToCart)
  Future<AddToCartResponse> addToCart(@Body() AddToCartRequest request);
}
