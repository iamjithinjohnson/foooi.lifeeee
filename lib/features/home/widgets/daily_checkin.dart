import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foi/utils/assets/svg_assets.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class DailyCheckIn extends GetView<HomeController> {
  const DailyCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isMoodCheckedIn.value) {
        return const SizedBox.shrink();
      }
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daily Check-in',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade800,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'How are you Feeling Today?',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(controller.moods.length, (index) {
                return GestureDetector(
                  onTap: () => controller.selectMood(index),
                  child: Column(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          color: controller.selectedMoodIndex.value == index
                              ? Colors.orange.withOpacity(0.1)
                              : const Color(0xFFF8FAFC),
                          shape: BoxShape.circle,
                          border: controller.selectedMoodIndex.value == index
                              ? Border.all(color: Colors.orange, width: 2)
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          _getMoodSvg(index),
                          width: 50.w,
                          height: 50.w,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        controller.moods[index],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight:
                              controller.selectedMoodIndex.value == index
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      );
    });
  }

  String _getMoodSvg(int index) {
    switch (index) {
      case 0: return AssetsSvg.emojiSmile;
      case 1: return AssetsSvg.emojiConfused;
      case 2: return AssetsSvg.emojiAnxious;
      case 3: return AssetsSvg.emojiTired;
      case 4: return AssetsSvg.emojiAngry;
      default: return AssetsSvg.emojiSmile;
    }
  }
}
