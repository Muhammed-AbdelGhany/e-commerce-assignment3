import 'package:ecommerce_assignment3/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? hintText;
  final String? labelText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool showValidationIcon;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.labelStyle,
    this.hintText,
    this.labelText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.keyboardType,
    this.showValidationIcon = false,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isValid = false;
  bool _hasInteracted = false;

  void _validateField(String? value) {
    if (!widget.showValidationIcon) return;

    setState(() {
      _hasInteracted = true;
      if (widget.validator != null) {
        _isValid = widget.validator!(value) == null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: widget.labelStyle ??
                TextStyles.font14DarkBlueMedium.copyWith(
                  color: const Color(0xFF6B7280),
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: 12.h),
        ],
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onChanged: _validateField,
          decoration: InputDecoration(
            isDense: false,
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            focusedBorder: widget.focusedBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E7EB),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
            enabledBorder: widget.enabledBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFE5E7EB),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintStyle: widget.hintStyle ??
                TextStyles.font14LightGrayRegular.copyWith(
                  color: const Color(0xFFC7C7CC),
                ),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.showValidationIcon && _hasInteracted
                ? _isValid
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20.sp,
                      )
                    : null
                : widget.suffixIcon,
            fillColor: widget.backgroundColor ?? const Color(0xFFF9FAFB),
            filled: true,
          ),
          obscureText: widget.isObscureText ?? false,
          style: widget.inputTextStyle ??
              TextStyles.font14DarkBlueMedium.copyWith(
                color: Colors.black,
              ),
          validator: widget.validator != null
              ? (value) {
                  return widget.validator!(value);
                }
              : null,
        ),
      ],
    );
  }
}
