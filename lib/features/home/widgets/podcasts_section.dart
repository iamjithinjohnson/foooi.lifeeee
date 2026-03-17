import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/routes/app_routes.dart';
import 'package:get/get.dart';

class PodcastsSection extends StatelessWidget {
  const PodcastsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F0),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PODCASTS',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          Text(
            'Listen and Learn',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 20.h),
          _buildPodcastItem(
            context,
            'If life feels unstable, you’re not failing',
            '4 min',
          ),
          _buildPodcastItem(
            context,
            'If life feels unstable, you’re not failing',
            '4 min',
          ),
          _buildPodcastItem(
            context,
            'If life feels unstable, you’re not failing',
            '4 min',
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            alignment: Alignment.center,
            child: Text(
              'View Collections',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF3F2109),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodcastItem(
    BuildContext context,
    String title,
    String duration,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.AUDIO_PLAYER);
        },
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                gradient: const LinearGradient(
                  colors: [Color(0xFF2B5AE1), Color(0xFF8A9A5B)],
                ),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white, size: 30.w),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    duration,
                    style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.black26, size: 24.w),
          ],
        ),
      ),
    );
  }
}
