import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/prayer_controller.dart';

class YourJourneyView extends GetView<PrayerController> {
  const YourJourneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(
            'You’re allowed to take\nthis slow',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 24.sp,
                  height: 1.2,
                ),
          ),
          SizedBox(height: 8.h),
          Text(
            'This week: 3 practices • 18 mins',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF64748B),
                ),
          ),
          SizedBox(height: 32.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.journeyItems.length,
            itemBuilder: (context, index) {
              final item = controller.journeyItems[index];
              return _buildJourneyItem(context, item, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyItem(BuildContext context, Map<String, dynamic> item, int index) {
    bool isCompleted = item['isCompleted'] ?? false;
    bool isLocked = item['isLocked'] ?? false;
    bool isLast = index == controller.journeyItems.length - 1;

    return IntrinsicHeight(
      child: Row(
        children: [
          // Timeline Pillar
          Column(
            children: [
              Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? const Color(0xFF2B5AE1) : Colors.transparent,
                  border: isCompleted 
                      ? null 
                      : Border.all(color: const Color(0xFFFF6B00), width: 2),
                ),
                child: isCompleted
                    ? Icon(Icons.check, color: Colors.white, size: 16.w)
                    : Icon(Icons.star, color: const Color(0xFFFF6B00), size: 16.w),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1.w,
                    color: const Color(0xFFF1F5F9),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16.w),
          // Content Card
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isLocked) {
                  Get.toNamed('/journey-detail');
                }
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Text(
                                item['subtitle'],
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: const Color(0xFF64748B),
                                    ),
                              ),
                              if (!isCompleted && !isLocked) ...[
                                const Spacer(),
                                Icon(Icons.arrow_circle_right, 
                                     color: const Color(0xFFFF6B00), 
                                     size: 20.w),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        width: 90.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isCompleted 
                                ? [const Color(0xFF8B4513), const Color(0xFFD2691E)]
                                : [const Color(0xFF4B0082), const Color(0xFF9400D3)],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
