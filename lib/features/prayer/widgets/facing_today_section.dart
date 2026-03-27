import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/routes/app_routes.dart';
import 'package:get/get.dart';

class FacingTodaySection extends StatelessWidget {
  const FacingTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'What are you facing today?',
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(fontSize: 22.sp),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 140.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(Routes.PRAYER_CONTENT),
                // onTap: () => Get.toNamed('/music-list'),
                child: _buildFacingCard(
                  'Anxiety',
                  'https://picsum.photos/seed/anxiety/200/200',
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.PRAYER_CONTENT),
                // onTap: () => Get.toNamed('/music-list'),
                child: _buildFacingCard(
                  'Wisdom',
                  'https://picsum.photos/seed/wisdom/200/200',
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.PRAYER_CONTENT),
                // onTap: () => Get.toNamed('/music-list'),
                child: _buildFacingCard(
                  'Forgiveness',
                  'https://picsum.photos/seed/forgive/200/200',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFacingCard(String title, String imageUrl) {
    return Container(
      width: 140.w,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF6B7FA8),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.h, left: 16.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 80.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.w),
                  ),
                  width: 70.r,
                  height: 70.r,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
