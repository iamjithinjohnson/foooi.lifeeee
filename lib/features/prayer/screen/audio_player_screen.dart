import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import '../controller/audio_player_controller.dart';

class AudioPlayerScreen extends GetView<AudioPlayerController> {
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
                  'STRENGTH',
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
                    'Psalm 46:1',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 32.sp,
                          height: 1.1,
                        ),
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    '"God is our refuge and strength, a very present help in trouble."',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF1E293B),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Obx(() => Text(
                  controller.formatDuration(controller.position.value),
                  style: TextStyle(
                    fontSize: 64.sp,
                    color: const Color(0xFFFF6B00),
                    fontFamily: 'Inter',
                  ),
                )),
                const Spacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => controller.seekBackward(),
                        icon: Icon(Icons.replay_10, color: const Color(0xFFFF6B00), size: 40.w),
                      ),
                      GestureDetector(
                        onTap: () => controller.togglePlayPause(),
                        child: Obx(() => Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFF4D00),
                          ),
                          child: Icon(
                            controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 50.w,
                          ),
                        )),
                      ),
                      IconButton(
                        onPressed: () => controller.seekForward(),
                        icon: Icon(Icons.forward_10, color: const Color(0xFFFF6B00), size: 40.w),
                      ),
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
                        child: Obx(() => Slider(
                          value: controller.duration.value.inMilliseconds > 0 
                              ? controller.position.value.inMilliseconds / controller.duration.value.inMilliseconds 
                              : 0.0,
                          onChanged: (v) {
                            final newMs = v * controller.duration.value.inMilliseconds;
                            controller.seek(Duration(milliseconds: newMs.toInt()));
                          },
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => Text(
                              controller.formatDuration(controller.position.value),
                              style: Theme.of(context).textTheme.bodySmall,
                            )),
                            Obx(() => Text(
                              controller.formatDuration(controller.duration.value),
                              style: Theme.of(context).textTheme.bodySmall,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.article_outlined, color: Color(0xFF1E293B)),
                  label: const Text(
                    'Transcript',
                    style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold),
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
