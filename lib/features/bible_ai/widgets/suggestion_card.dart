import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SuggestionCard({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFD3E6F5).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TEXT 1',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2B5AE1).withValues(alpha: 0.4),
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF3F2109),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
