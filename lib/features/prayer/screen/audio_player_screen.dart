import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image with Gradient
          Column(
            children: [
              Container(
                height: 300.h,
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
                        Colors.black.withOpacity(0.2),
                        Colors.white.withOpacity(0.8),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.arrow_back, color: Color(0xFF1E293B), size: 18.w),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  'Wisdom',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF64748B),
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Text(
                    'Imperfections and Lord of Light',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 32.sp,
                          height: 1.1,
                        ),
                  ),
                ),
                const Spacer(flex: 2),
                Text(
                  '3:40s',
                  style: TextStyle(
                    fontSize: 64.sp,
                    color: const Color(0xFFFF6B00),
                    fontFamily: 'Inter',
                  ),
                ),
                const Spacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.replay_10, color: const Color(0xFFFF6B00), size: 40.w),
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF4D00),
                        ),
                        child: Icon(Icons.play_arrow, color: Colors.white, size: 50.w),
                      ),
                      Icon(Icons.forward_10, color: const Color(0xFFFF6B00), size: 40.w),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 4.h,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.w),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 12.w),
                          activeTrackColor: const Color(0xFFFF4D00),
                          inactiveTrackColor: const Color(0xFFF1F5F9),
                          thumbColor: const Color(0xFFFF4D00),
                        ),
                        child: Slider(
                          value: 0.1,
                          onChanged: (v) {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('0:10', style: Theme.of(context).textTheme.bodySmall),
                            Text('3:40', style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.article_outlined, color: const Color(0xFF1E293B)),
                  label: Text(
                    'Transcript',
                    style: TextStyle(color: const Color(0xFF1E293B), fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
