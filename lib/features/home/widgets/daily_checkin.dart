import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class DailyCheckIn extends GetView<HomeController> {
  const DailyCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
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
              fontWeight: FontWeight.w600,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'How are you Feeling Today?',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.moods.length, (index) {
              return Obx(() => GestureDetector(
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
                      child: Text(
                        controller.moodEmojis[index],
                        style: TextStyle(fontSize: 24.sp),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      controller.moods[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: controller.selectedMoodIndex.value == index 
                            ? FontWeight.bold 
                            : FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ));
            }),
          ),
        ],
      ),
    );
  }
}
