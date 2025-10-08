import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/data/models/product_model.dart';

class ProductDescriptionSection extends StatefulWidget {
  final ProductModel product;

  const ProductDescriptionSection({
    super.key,
    required this.product,
  });

  @override
  State<ProductDescriptionSection> createState() => _ProductDescriptionSectionState();
}

class _ProductDescriptionSectionState extends State<ProductDescriptionSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final description = widget.product.description ??
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1D1E20),
            ),
          ),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 15.sp,
                color: const Color(0xFF8F959E),
                height: 1.6,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: _isExpanded
                      ? description
                      : (description.length > 100
                          ? '${description.substring(0, 100)}... '
                          : '$description '),
                ),
                if (description.length > 100)
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        _isExpanded ? 'Read Less..' : 'Read More..',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: const Color(0xFF1D1E20),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
