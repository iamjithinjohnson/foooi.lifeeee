import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionItem('Pray Now', Icons.front_hand, Colors.blue),
            _buildActionItem('30-sec Prayer', Icons.timer, Colors.orange),
            _buildActionItem('Exam Stress', Icons.psychology, Colors.purple),
            _buildActionItem('Prayer Request', Icons.favorite, Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _buildActionItem(String title, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.w,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: color, size: 32.w),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 70.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
