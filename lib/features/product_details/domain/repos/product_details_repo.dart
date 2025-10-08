import '../../../../core/networking/api_result.dart';
import '../../../home/data/models/product_model.dart';

abstract class ProductDetailsRepo {
  Future<ApiResult<ProductModel>> getProductDetails(String productId);
}
