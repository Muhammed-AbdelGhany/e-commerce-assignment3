import 'package:ecommerce_assignment3/core/networking/api_error_handler.dart';
import 'package:ecommerce_assignment3/core/networking/api_result.dart';
import 'package:ecommerce_assignment3/core/networking/api_service.dart';
import 'package:ecommerce_assignment3/features/login/data/models/login_request_body.dart';
import 'package:ecommerce_assignment3/features/login/data/models/login_response.dart';
import 'package:ecommerce_assignment3/features/login/domain/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService _apiService;

  LoginRepoImpl(this._apiService);

  @override
  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
