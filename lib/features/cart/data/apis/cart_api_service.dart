import 'package:dio/dio.dart';
import 'package:ecommerce_assignment3/core/networking/api_constants.dart';
import 'package:ecommerce_assignment3/features/cart/data/apis/cart_api_endpoints.dart';
import 'package:ecommerce_assignment3/features/cart/data/models/cart_response.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CartApiService {
  factory CartApiService(Dio dio) = _CartApiService;

  @GET(CartApiEndpoints.cart)
  Future<CartResponse> getCart();
}
