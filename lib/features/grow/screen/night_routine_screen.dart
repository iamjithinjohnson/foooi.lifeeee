import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';

class NightRoutineScreen extends StatelessWidget {
  const NightRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildRoutineLayout(
      context,
      'Night Routine',
      AssetsImage.night_bg,
      [
        'Reflect on your day',
        'Name one thing you\'re grateful for',
        'Read Psalm 4:8',
        'Rest in God\'s peace',
      ],
    );
  }

  Widget _buildRoutineLayout(BuildContext context, String title, String bgImage, List<String> steps) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black.withOpacity(0.1), Colors.white],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Color(0xFF1E293B), size: 18.w),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Center(
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 36.sp),
                      ),
                      Text(
                        'Want something light today?',
                        style: TextStyle(fontSize: 18.sp, color: const Color(0xFF64748B)),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'TODAY • 24RD DEC, 2025',
                    style: TextStyle(letterSpacing: 1.2, fontWeight: FontWeight.bold, fontSize: 14.sp, color: const Color(0xFF1E293B)),
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemCount: steps.length,
                    itemBuilder: (context, index) {
                      return _buildStepItem(context, index + 1, steps[index], false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(BuildContext context, int number, String title, bool isCompleted) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9)))),
      child: Row(
        children: [
          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF2B5AE1), width: 1.5.w),
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A)),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: const Color(0xFF0F172A)),
            ),
          ),
          Icon(
            isCompleted ? Icons.check_circle : Icons.arrow_circle_right_rounded,
            color: isCompleted ? const Color(0xFF2B5AE1) : const Color(0xFFFF4D00),
            size: 24.w,
          ),
        ],
      ),
    );
  }
}
