import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeelingBasedSection extends StatelessWidget {
  const FeelingBasedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Based on what you\'re\nfeeling today',
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(fontSize: 22.sp),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 180.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              GestureDetector(
                onTap: () => Get.toNamed('/music-list'),
                child: _buildFeelingCard(
                  'When prayer feels fake',
                  '7 MIN • GENTLE',
                  'https://picsum.photos/seed/prayer1/400/300',
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed('/music-list'),
                child: _buildFeelingCard(
                  'Finding peace in chaos',
                  '5 MIN • GENTLE',
                  'https://picsum.photos/seed/peace1/400/300',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeelingCard(String title, String info, String imageUrl) {
    return Container(
      width: 240.w,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 28,
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  info,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white.withOpacity(0.7),
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
