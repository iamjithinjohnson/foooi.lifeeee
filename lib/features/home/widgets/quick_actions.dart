import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foi/utils/assets/svg_assets.dart';
import 'package:foi/utils/routes/app_routes.dart';
import 'package:get/get.dart';

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
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionItem(
              context,
              'Pray\nNow',
              AssetsSvg.prayNow,
              onTap: () => Get.toNamed(Routes.PRAYER_SITUATION),
            ),
            _buildActionItem(
              context,
              'Exam Stress',
              AssetsSvg.examStress,
              onTap: () => Get.toNamed(Routes.PRAYER_SITUATION, arguments: {'category': 'Exam Stress'}),
            ),
            _buildActionItem(
              context,
              'Prayer Request',
              AssetsSvg.prayerRequest,
              onTap: () => Get.toNamed(Routes.PRAYER_REQUEST),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionItem(
    BuildContext context,
    String title,
    String svgAsset, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(svgAsset),
          SizedBox(height: 12.h),
          SizedBox(
            width: 80.w,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
