import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/app_colors.dart';

class RoutineHeader extends StatelessWidget {
  final VoidCallback onClose;
  final bool isStarted;
  final int currentStep;
  final int totalSteps;
  final Color themeColor;

  const RoutineHeader({
    super.key,
    required this.onClose,
    required this.isStarted,
    this.currentStep = 0,
    this.totalSteps = 0,
    this.themeColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onClose,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.close,
                color: AppColors.textPrimary,
                size: 20.w,
              ),
            ),
          ),
          if (isStarted)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: themeColor.withOpacity(0.2)),
              ),
              child: Text(
                'Step $currentStep/$totalSteps',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: themeColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
