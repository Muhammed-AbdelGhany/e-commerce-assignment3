import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/repos/cart_repo.dart';
import '../apis/cart_api_service.dart';
import '../models/cart_response.dart';

class CartRepoImpl implements CartRepo {
  final CartApiService _apiService;

  CartRepoImpl(this._apiService);

  @override
  Future<ApiResult<CartResponse>> getCart() async {
    try {
      final response = await _apiService.getCart();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
