import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/app_colors.dart';

class RoutineStepCard extends StatelessWidget {
  final int index;
  final String title;
  final bool isActive;
  final bool isDone;
  final Widget? content;
  final Color themeColor;

  const RoutineStepCard({
    super.key,
    required this.index,
    required this.title,
    required this.isActive,
    required this.isDone,
    this.content,
    this.themeColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: isActive ? 30.h : 20.h,
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(
          color: isActive ? themeColor : Colors.transparent,
          width: 2.w,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: themeColor.withOpacity(0.12),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ]
            : [],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildStepIcon(),
              SizedBox(width: 20.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
              if (isDone)
                Icon(Icons.check_circle, color: AppColors.success, size: 24.w),
            ],
          ),
          if (isActive && content != null) ...[
            SizedBox(height: 24.h),
            content!,
          ],
        ],
      ),
    );
  }

  Widget _buildStepIcon() {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: isActive
            ? themeColor
            : (isDone
                ? AppColors.success.withOpacity(0.1)
                : AppColors.iconBgGrey),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: isDone
            ? Icon(Icons.check, color: AppColors.success, size: 24.w)
            : Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.white : AppColors.textPrimary,
                ),
              ),
      ),
    );
  }
}
