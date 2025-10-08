import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../data/models/category_model.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final String? selectedCategoryId;
  final ValueChanged<String?> onCategoryTap;

  const CategoriesList({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose Brand',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: ColorsManager.textDark,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF8F959E),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return _CategoryItem(
                name: category.name ?? '',
                imageUrl: category.coverPictureUrl,
                isSelected: selectedCategoryId == category.id,
                onTap: () => onCategoryTap(category.id),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.name,
    this.imageUrl,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color(0xFFE7E8EA),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imageUrl != null)
                CachedNetworkImage(
                  imageUrl: imageUrl!,
                  width: 30.w,
                  height: 30.h,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) => Container(
                    width: 30.w,
                    height: 30.h,
                    color: const Color(0xFFF5F5F5),
                    child: Icon(
                      Icons.image,
                      size: 16.sp,
                      color: const Color(0xFF8F959E),
                    ),
                  ),
                ),
              if (imageUrl != null) SizedBox(width: 8.w),
              Text(
                name,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.textDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
