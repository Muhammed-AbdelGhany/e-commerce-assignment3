import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response.g.dart';

@JsonSerializable()
class AddToCartResponse {
  final String message;
  final String id;
  final String productId;
  final int quantity;

  AddToCartResponse({
    required this.message,
    required this.id,
    required this.productId,
    required this.quantity,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseToJson(this);
}
