import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/app_colors.dart';

abstract class WwTextFieldBase extends StatelessWidget {
  final String? title;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function()? suffixTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final bool description;
  final TextInputType keyboardType;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final bool obscureText;
  final bool autofocus;
  final bool filled;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool required;
  final TextCapitalization textCapitalization;
  final bool enableBorder;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function()? onTap;
  final bool enableFocusBorder;
  final Color? fillColor;
  final Iterable<String>? autofillHints;
  final Function(String)? onFieldSubmitted;
  final AutovalidateMode? autovalidateMode;
  final bool enable;
  final TextAlign textAlign;
  final TextStyle? style;
  const WwTextFieldBase({
    super.key,
    this.title,
    this.onChanged,
    this.controller,
    this.suffixTap,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.description = false,
    this.keyboardType = TextInputType.name,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.autofocus = false,
    this.validator,
    this.filled = true,
    this.readOnly = false,
    this.required = false,
    this.enableBorder = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.enableFocusBorder = true,
    this.fillColor,
    this.autofillHints,
    this.onFieldSubmitted,
    this.autovalidateMode,
    this.enable = true,
    this.textAlign = TextAlign.start,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          RichText(
            text: TextSpan(
              text: title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.grey2,
              ),
              children: required
                  ? [
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                    ]
                  : [],
            ),
          ),
        const SizedBox(height: 5),
        SizedBox(
          // height: maxLines == 1 ? 40.h : null,
          child: TextFormField(
            onTap: onTap,
            enabled: enable,
            readOnly: readOnly,
            onChanged: onChanged,
            controller: controller,
            autofocus: autofocus,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onFieldSubmitted: (v) {
              onFieldSubmitted?.call(v);
              // FocusScope.of(context).nextFocus();
            },
            textCapitalization: textCapitalization,

            // cursorColor: Theme.of(context).colorScheme.onPrimaryContainer,
            expands: description,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLines,
            inputFormatters: inputFormatters,
            validator: validator,
            autovalidateMode: autovalidateMode,
            maxLength: maxLength ?? 50,
            textAlign: textAlign,
            style: style ?? TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            autofillHints: autofillHints,

            // style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              isDense: false,
              counterText: maxLines == 1 ? '' : null,
              filled: filled,
              fillColor: fillColor ?? (filled ? Colors.white : null),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color(0xFF7A7A7A),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              // labelText: labelText,
              label: labelText != null
                  ? RichText(
                      text: TextSpan(
                        text: labelText,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7A7A7A),
                        ),
                        children: required
                            ? [
                                const TextSpan(
                                  text: ' *',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ]
                            : [],
                      ),
                    )
                  : null,
              labelStyle: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),

              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8),
              //   borderSide: BorderSide(color: AppColors.primary),
              // ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: enableBorder
                    ? BorderSide(color: Color(0xffD0D5DD))
                    : BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: enableFocusBorder
                    ? BorderSide(color: AppColors.primary)
                    : BorderSide.none,
              ),
              // This ensures vertical centering of hint text
              contentPadding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 10,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
              // errorStyle: TextStyle(fontSize: 0, height: 0),
              // Center hint text vertically
              // alignLabelWithHint: true,
              prefixIconConstraints: const BoxConstraints(
                // minHeight: 25,
                minWidth: 45,
              ),
              prefixIcon: prefixIcon,
              suffixIconConstraints: const BoxConstraints(
                // minHeight: 25,
                minWidth: 45,
              ),
              // Properly configure the suffix icon
              suffixIcon: suffixTap == null
                  ? null
                  : GestureDetector(
                      onTap: () => suffixTap?.call(),
                      child: suffixIcon,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
