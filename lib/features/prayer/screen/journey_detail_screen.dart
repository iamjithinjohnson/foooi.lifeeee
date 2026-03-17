import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';

class JourneyDetailScreen extends StatelessWidget {
  const JourneyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Bibendum ultricies semper mus hendrerit nec mus elit consectetur interdum. Nec amet varius erat feugiat vulputate sit feugiat volutpat. Arcu venenatis tristique at aliquet lectus pellentesque aliquet quam tellus. Non hendrerit pellentesque enim pretium augue viverra ullamcorper eu. Id aliquam eu neque lobortis est egestas massa morbi. Ipsum amet ullamcorper facilisi eu arcu et in lectus gravida. Quisque hendrerit enim pellentesque euismod aliquet enim volutpat. Ornare sit feugiat urna dignissim id consequat nulla ultricies. Maecenas sed a quam etiam venenatis.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.sp,
                      height: 1.6,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur. Bibendum ultricies semper mus hendrerit nec mus elit consectetur interdum. Nec amet varius erat feugiat vulputate sit feugiat volutpat. Arcu venenatis tristique at aliquet lectus pellentesque aliquet quam tellus. Non hendrerit pellentesque enim pretium augue viverra ullamcorper eu. Id aliquam eu neque lobortis est egestas massa morbi. Ipsum amet ullamcorper facilisi eu arcu et in lectus gravida. Quisque hendrerit enim pellentesque euismod aliquet enim volutpat.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.sp,
                      height: 1.6,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsImage.bg_1),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                  Colors.white.withOpacity(0.9),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 10.h,
          left: 16.w,
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          bottom: 24.h,
          left: 24.w,
          right: 24.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Genesis 1:1',
                      style: Theme.of(
                        context,
                      ).textTheme.displayMedium?.copyWith(fontSize: 36.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '7 MIN READ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: const Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 64.w,
                height: 64.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFF4D00),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.AUDIO_PLAYER);
                  },
                  icon: Icon(Icons.play_arrow, color: Colors.white, size: 36.w),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
