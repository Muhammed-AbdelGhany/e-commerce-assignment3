import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../home/data/models/product_model.dart';

part 'product_details_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProductDetailsApiService {
  factory ProductDetailsApiService(Dio dio) = _ProductDetailsApiService;

  @GET('products/{id}')
  Future<ProductModel> getProductDetails(@Path('id') String id);
}
