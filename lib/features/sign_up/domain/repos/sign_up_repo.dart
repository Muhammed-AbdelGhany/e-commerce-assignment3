import 'package:ecommerce_assignment3/core/networking/api_result.dart';
import 'package:ecommerce_assignment3/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:ecommerce_assignment3/features/sign_up/data/models/sign_up_response.dart';

abstract class SignupRepo {
  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody);
}
