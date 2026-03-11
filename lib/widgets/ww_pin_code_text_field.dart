import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class WwPinCodeField extends StatelessWidget {
  const WwPinCodeField({
    super.key,
    required this.onChanged,
    this.alignment,
    this.pinController,
    this.onCompleted,
    this.length = 6,
  });

  final Alignment? alignment;
  final PinInputController? pinController;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final int length;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildPinField(context),
          )
        : _buildPinField(context);
  }

  Widget _buildPinField(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialPinField(
      length: length,
      pinController: pinController,
      autoFocus: true,
      onChanged: onChanged,
      onCompleted: onCompleted,
      theme: MaterialPinTheme(
        cellSize: Size(50.w, 64.w),
        shape: MaterialPinShape.outlined,
        borderRadius: BorderRadius.circular(12.r),
        spacing: 8.w,
        borderWidth: 1.5,
        borderColor: const Color(0xFFE8ECEF),
        focusedBorderColor: theme.primaryColor,
        textStyle: theme.textTheme.displayMedium?.copyWith(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF0F172A),
        ),
      ),
    );
  }
}
