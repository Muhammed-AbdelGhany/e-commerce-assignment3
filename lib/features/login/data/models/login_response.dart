import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'accessToken')
  String? accessToken;

  @JsonKey(name: 'expiresAtUtc')
  String? expiresAtUtc;

  @JsonKey(name: 'refreshToken')
  String? refreshToken;

  LoginResponse({
    this.accessToken,
    this.expiresAtUtc,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
