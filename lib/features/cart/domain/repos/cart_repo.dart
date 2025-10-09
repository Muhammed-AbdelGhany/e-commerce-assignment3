import '../../../../core/networking/api_result.dart';
import '../../data/models/cart_response.dart';

abstract class CartRepo {
  Future<ApiResult<CartResponse>> getCart();
}
