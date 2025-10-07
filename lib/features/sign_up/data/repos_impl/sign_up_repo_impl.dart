import 'package:ecommerce_assignment3/core/networking/api_service.dart';
import 'package:ecommerce_assignment3/core/networking/api_error_handler.dart';
import 'package:ecommerce_assignment3/core/networking/api_result.dart';
import 'package:ecommerce_assignment3/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:ecommerce_assignment3/features/sign_up/data/models/sign_up_response.dart';
import 'package:ecommerce_assignment3/features/sign_up/domain/repos/sign_up_repo.dart';

class SignupRepoImpl implements SignupRepo {
  final ApiService _apiService;

  SignupRepoImpl(this._apiService);

  @override
  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
