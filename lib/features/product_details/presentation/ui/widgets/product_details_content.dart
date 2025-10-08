import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/data/models/product_model.dart';
import 'product_image_section.dart';
import 'product_info_section.dart';
import 'product_size_section.dart';
import 'product_description_section.dart';
import 'product_reviews_section.dart';
import 'product_bottom_bar.dart';

class ProductDetailsContent extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsContent({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageSection(product: product),
              ProductInfoSection(product: product),
              ProductSizeSection(),
              ProductDescriptionSection(product: product),
              ProductReviewsSection(product: product),
              SizedBox(height: 100.h), // Space for bottom bar
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ProductBottomBar(product: product),
        ),
      ],
    );
  }
}
