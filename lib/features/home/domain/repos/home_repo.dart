import 'package:ecommerce_assignment3/core/networking/api_result.dart';
import 'package:ecommerce_assignment3/features/home/data/models/specializations_response_model.dart';

abstract class HomeRepo {
  Future<ApiResult<SpecializationsResponseModel>> getSpecialization();
}
