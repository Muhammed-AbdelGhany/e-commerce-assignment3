import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'productCode')
  String? productCode;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'arabicName')
  String? arabicName;

  @JsonKey(name: 'arabicDescription')
  String? arabicDescription;

  @JsonKey(name: 'coverPictureUrl')
  String? coverPictureUrl;

  @JsonKey(name: 'productPictures')
  List<String>? productPictures;

  @JsonKey(name: 'price')
  double? price;

  @JsonKey(name: 'stock')
  int? stock;

  @JsonKey(name: 'weight')
  double? weight;

  @JsonKey(name: 'color')
  String? color;

  @JsonKey(name: 'rating')
  double? rating;

  @JsonKey(name: 'reviewsCount')
  int? reviewsCount;

  @JsonKey(name: 'discountPercentage')
  double? discountPercentage;

  @JsonKey(name: 'sellerId')
  String? sellerId;

  @JsonKey(name: 'categories')
  List<String>? categories;

  ProductModel({
    this.id,
    this.productCode,
    this.name,
    this.description,
    this.arabicName,
    this.arabicDescription,
    this.coverPictureUrl,
    this.productPictures,
    this.price,
    this.stock,
    this.weight,
    this.color,
    this.rating,
    this.reviewsCount,
    this.discountPercentage,
    this.sellerId,
    this.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: 'items')
  List<ProductModel>? items;

  ProductsResponse({this.items});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ProductsRequest {
  @JsonKey(name: 'searchTerm')
  String? searchTerm;

  @JsonKey(name: 'category')
  String? category;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'nameArabic')
  String? nameArabic;

  @JsonKey(name: 'descriptionArabic')
  String? descriptionArabic;

  @JsonKey(name: 'coverPictureUrl')
  String? coverPictureUrl;

  @JsonKey(name: 'price')
  double? price;

  @JsonKey(name: 'color')
  String? color;

  @JsonKey(name: 'sellerId')
  String? sellerId;

  ProductsRequest({
    this.searchTerm,
    this.category,
    this.name,
    this.description,
    this.nameArabic,
    this.descriptionArabic,
    this.coverPictureUrl,
    this.price,
    this.color,
    this.sellerId,
  });

  Map<String, dynamic> toJson() => _$ProductsRequestToJson(this);
}
