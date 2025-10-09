import 'package:json_annotation/json_annotation.dart';

import 'cart_item_model.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  final String cartId;
  final List<CartItemModel> cartItems;

  CartResponse({
    required this.cartId,
    required this.cartItems,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
