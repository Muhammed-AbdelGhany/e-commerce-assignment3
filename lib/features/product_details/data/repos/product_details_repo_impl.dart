import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/product_model.dart';
import '../../domain/repos/product_details_repo.dart';
import '../apis/product_details_api_service.dart';

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
}
