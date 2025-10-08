import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/data/models/product_model.dart';

class ProductImageSection extends StatefulWidget {
  final ProductModel product;

  const ProductImageSection({
    super.key,
    required this.product,
  });

  @override
  State<ProductImageSection> createState() => _ProductImageSectionState();
}

class _ProductImageSectionState extends State<ProductImageSection> {
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final images = widget.product.productPictures ?? [];
    final mainImage = images.isNotEmpty ? images[_selectedImageIndex] : widget.product.coverPictureUrl;

    return Column(
      children: [
        // Main Image
        Container(
          height: 280.h,
          width: double.infinity,
          color: const Color(0xFFF8F8F8),
          child: mainImage != null
              ? CachedNetworkImage(
                  imageUrl: mainImage,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : const Icon(Icons.image, size: 100),
        ),
        SizedBox(height: 20.h),

        // Thumbnail Images
        if (images.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 77.h,
              child: Row(
                children: List.generate(
                  images.length > 4 ? 4 : images.length,
                  (index) => _buildThumbnail(images[index], index),
                ),
              ),
            ),
          ),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget _buildThumbnail(String imageUrl, int index) {
    final isSelected = _selectedImageIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImageIndex = index;
        });
      },
      child: Container(
        width: 77.w,
        height: 77.h,
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11.r),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
