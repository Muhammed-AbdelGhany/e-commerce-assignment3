import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/product_model.dart';
import '../../domain/repos/product_details_repo.dart';
import '../apis/product_details_api_service.dart';
import '../models/add_to_cart_request.dart';
import '../models/add_to_cart_response.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsApiService _apiService;

  ProductDetailsRepoImpl(this._apiService);

  @override
  Future<ApiResult<ProductModel>> getProductDetails(String productId) async {
    try {
      final response = await _apiService.getProductDetails(productId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<AddToCartResponse>> addToCart(String productId) async {
    try {
      final request = AddToCartRequest(productId: productId);
      final response = await _apiService.addToCart(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
