import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We can get plan title and subtitle from Get.arguments if needed
    final String title = Get.arguments?['title'] ?? '7-Day Peace Plan';
    final String subtitle = Get.arguments?['subtitle'] ?? 'Find inner peace through daily scripture on God\'s calming presence.';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back, color: const Color(0xFF1E293B), size: 20.w),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Playfair Display', // Using serif-like font if available, or default
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xFF334155),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  _buildChapterItem(
                    chapter: 'Chapter 1',
                    title: 'When prayer feels fake',
                    icon: Icons.menu_book,
                    isCompleted: true,
                  ),
                  _buildChapterItem(
                    chapter: 'Chapter 1',
                    title: 'When prayer feels fake',
                    icon: Icons.menu_book,
                  ),
                  _buildChapterItem(
                    chapter: 'Chapter 1',
                    title: 'When prayer feels fake',
                    icon: Icons.graphic_eq, // Wave icon
                  ),
                  _buildChapterItem(
                    chapter: 'Chapter 2',
                    title: 'When prayer feels fake',
                    icon: Icons.menu_book,
                  ),
                  _buildChapterItem(
                    title: 'When prayer feels fake',
                    icon: Icons.menu_book,
                  ),
                  _buildChapterItem(
                    chapter: 'Chapter 3',
                    title: 'When prayer feels fake',
                    icon: Icons.graphic_eq,
                  ),
                  _buildChapterItem(
                    chapter: 'Chapter 3',
                    title: 'When prayer feels fake',
                    icon: Icons.menu_book,
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterItem({
    String? chapter,
    required String title,
    required IconData icon,
    bool isCompleted = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFF4D00),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: Colors.white, size: 40.w),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (chapter != null)
                  Text(
                    chapter,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                if (isCompleted)
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: const Color(0xFFFF4D00), size: 14.w),
                        SizedBox(width: 4.w),
                        Text(
                          'Completed',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFFFF4D00),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: const Color(0xFF1E293B), size: 24.w),
        ],
      ),
    );
  }
}
