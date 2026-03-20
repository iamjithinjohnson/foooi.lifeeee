import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:get/get.dart';
import '../controller/prayer_controller.dart';

class PrayerHeader extends GetView<PrayerController> {
  const PrayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImage.bg_2),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 20.h),
              Text(
                'Practice',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 32.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Small steps count',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  color: const Color(0xFF64748B),
                ),
              ),
              SizedBox(height: 40.h),
              // SizedBox(height: 30.h),
              // _buildTabs(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.8),
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

/*
  Widget _buildTabs() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem(0, 'Practice Hub'),
          // _buildTabItem(1, 'Your journey'),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String title) {
    bool isSelected = controller.selectedTab.value == index;
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? const Color(0xFF2B5AE1) : const Color(0xFF94A3B8),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 3.h,
            width: 80.w,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF2B5AE1) : Colors.transparent,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
*/
}
