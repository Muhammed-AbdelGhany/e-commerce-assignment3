import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/product_model.dart';
import '../../data/models/add_to_cart_response.dart';

abstract class ProductDetailsRepo {
  Future<ApiResult<ProductModel>> getProductDetails(String productId);
  Future<ApiResult<AddToCartResponse>> addToCart(String productId);
}
