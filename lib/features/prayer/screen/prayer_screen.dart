import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/prayer_controller.dart';
import '../widgets/prayer_header.dart';
import '../widgets/category_grid.dart';
import '../widgets/practice_tool_grid.dart';
import '../widgets/facing_today_section.dart';

// import '../widgets/your_journey_view.dart';

class PrayerScreen extends GetView<PrayerController> {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const PrayerHeader(), _buildContent(context)],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    // if (controller.selectedTab.value == 0) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        const CategoryGrid(),
        // SizedBox(height: 24.h),
        // const PathCard(),
        // SizedBox(height: 24.h),
        const PracticeToolGrid(),
        SizedBox(height: 32.h),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        //   child: Text(
        //     'PRAYER MODES',
        //     style: Theme.of(context).textTheme.bodySmall?.copyWith(
        //       fontSize: 12.sp,
        //       fontWeight: FontWeight.bold,
        //       color: const Color(0xFF94A3B8),
        //       letterSpacing: 1.2,
        //     ),
        //   ),
        // ),
        // SizedBox(height: 8.h),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        //   child: Text(
        //     'Record Your Prayers',
        //     style: Theme.of(
        //       context,
        //     ).textTheme.displayMedium?.copyWith(fontSize: 22.sp),
        //   ),
        // ),
        // SizedBox(height: 20.h),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        //   child: Column(
        //     children: [
        //       PrayerModeCard(
        //         title: 'Pray for 30 sec',
        //         xp: '40XP',
        //         background: Container(
        //           decoration: const BoxDecoration(
        //             gradient: RadialGradient(
        //               colors: [Color(0xFF000000), Color(0xFF4A148C)],
        //             ),
        //           ),
        //         ),
        //       ),
        //       PrayerModeCard(
        //         title: 'Pray for 2 Min',
        //         xp: '40XP',
        //         background: Container(
        //           decoration: const BoxDecoration(
        //             gradient: RadialGradient(
        //               colors: [Color(0xFF3E1E00), Color(0xFFA64A12)],
        //             ),
        //           ),
        //         ),
        //       ),
        //       PrayerModeCard(
        //         title: 'Pray for 5 Min',
        //         xp: '40XP',
        //         background: Container(
        //           decoration: const BoxDecoration(
        //             gradient: RadialGradient(
        //               colors: [Color(0xFF3E1E00), Color(0xFFA64A12)],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: 32.h),
        // const FeelingBasedSection(),
        // SizedBox(height: 32.h),
        const FacingTodaySection(),
        SizedBox(height: 100.h),
      ],
    );
    // } else {
    //   return const YourJourneyView();
    // }
  }
}
