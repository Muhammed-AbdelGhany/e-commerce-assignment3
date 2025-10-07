import 'package:ecommerce_assignment3/core/networking/api_result.dart';
import 'package:ecommerce_assignment3/features/login/data/models/login_request_body.dart';
import 'package:ecommerce_assignment3/features/login/data/models/login_response.dart';

abstract class LoginRepo {
  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody);
}
