import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foi/utils/assets/svg_assets.dart';

class PracticeToolGrid extends StatelessWidget {
  const PracticeToolGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your space to connect with God',
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(fontSize: 22.sp),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildToolItem(
                context,
                'Need Guidance',
                'Day-to-day journey',
                AssetsSvg.bible,
              ),
              _buildToolItem(
                context,
                'Speak your prayer',
                'Day-to-day journey',
                AssetsSvg.speak,
              ),
              _buildToolItem(
                context,
                'Write your prayer',
                'Beal — understand',
                AssetsSvg.write,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolItem(
    BuildContext context,
    String title,
    String subtitle,
    String svgAsset,
  ) {
    return Container(
      width: 108.w,
      height: 125.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(svgAsset, width: 28.w),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 10.sp,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}
