import 'package:ecommerce_assignment3/core/networking/api_error_handler.dart';
import 'package:ecommerce_assignment3/core/networking/api_result.dart';
import 'package:ecommerce_assignment3/features/home/data/apis/home_api_service.dart';
import 'package:ecommerce_assignment3/features/home/data/models/specializations_response_model.dart';
import 'package:ecommerce_assignment3/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepoImpl(this._homeApiService);

  @override
  Future<ApiResult<SpecializationsResponseModel>> getSpecialization() async {
    try {
      final response = await _homeApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
