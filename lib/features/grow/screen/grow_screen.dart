import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/utils/assets/svg_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controller/grow_controller.dart';

class GrowScreen extends GetView<GrowController> {
  const GrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 24.h),
            _buildRoutineCards(context),
            SizedBox(height: 32.h),
            _buildSectionHeader(
              context,
              'Bible Reading Plans',
              "You're allowed to take this slow",
            ),
            _buildReadingPlans(context),
            SizedBox(height: 32.h),
            _buildSectionHeader(
              context,
              'Tiny Habits',
              'Small habits to change our daily lives for better',
            ),
            _buildTinyHabits(context),
            SizedBox(height: 32.h),
            _buildWeeklyReflection(context),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImage.bg_2),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          SvgPicture.asset(AssetsSvg.praise, width: 44.w),
          SizedBox(height: 8.h),
          Text(
            'Grow',
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(fontSize: 32.sp),
          ),
          Text(
            'Build your faith, one step at a time',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutineCards(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: _buildRoutineItem(
              context,
              'Morning Routine',
              '5 Min',
              AssetsSvg.morning,
              () => Get.toNamed('/morning-routine'),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: _buildRoutineItem(
              context,
              'Night Routine',
              '5 Min',
              AssetsSvg.night,
              () => Get.toNamed('/night-routine'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoutineItem(
    BuildContext context,
    String title,
    String time,
    String icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFF1F5F9)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon, width: 32.w),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  color: const Color(0xFFFF4D00),
                  size: 18.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: const Color(0xFF64748B)),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildReadingPlans(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(
              '/plan-detail',
              arguments: {
                'title': '7-Day Peace Plan',
                'subtitle':
                    "Find inner peace through daily scripture on God's calming presence.",
              },
            ),
            child: _buildPlanItem(
              context,
              '7-Day Peace Plan',
              "Find inner peace through daily scripture on God's calming presence.",
              '3 days left • Gentle • +5XP',
              true,
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(
              '/plan-detail',
              arguments: {
                'title': '21-Day Discipline Plan',
                'subtitle':
                    'Build spiritual discipline with daily devotions and reflection.',
              },
            ),
            child: _buildPlanItem(
              context,
              '21-Day Discipline Plan',
              'Build spiritual discipline with daily devotions and reflection.',
              '18 days left • Gentle • +6XP',
              false,
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(
              '/plan-detail',
              arguments: {
                'title': '30 Days of Psalms',
                'subtitle': 'Journey through the Psalms — one chapter per day.',
              },
            ),
            child: _buildPlanItem(
              context,
              '30 Days of Psalms',
              'Journey through the Psalms — one chapter per day.',
              '7 days left • Gentle • +5XP',
              false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanItem(
    BuildContext context,
    String title,
    String description,
    String info,
    bool isActive,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              isActive
                  ? const Icon(Icons.check_circle, color: Color(0xFF2B5AE1))
                  : Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF4D00),
                      ),
                    ),
              Container(
                width: 2.w,
                height: 80.h,
                color: const Color(0xFFF1F5F9),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            description,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: const Color(0xFF64748B)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 80.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      info,
                      style: TextStyle(
                        color: const Color(0xFF2B5AE1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Color(0xFFFF4D00),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTinyHabits(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          _buildHabitItem('Sleep before 11pm', '4 Days Streak'),
          _buildHabitItem('No phone during prayer', null),
          _buildHabitItem('Being Kinder to 5 people', null, isLast: true),
        ],
      ),
    );
  }

  Widget _buildHabitItem(String title, String? streak, {bool isLast = false}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
      ),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
            ),
          ),
          if (streak != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7ED),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                '🔥 $streak',
                style: TextStyle(
                  color: const Color(0xFFC05621),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWeeklyReflection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Deep slate for high contrast
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E293B).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.auto_awesome,
                  color: Colors.amber,
                  size: 16.w,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'WEEKLY REFLECTION',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'What did God teach you\nthis week?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              height: 1.2,
              fontFamily: 'Playfair Display',
            ),
          ),
          SizedBox(height: 24.h),
          _buildReflectionButton(),
          SizedBox(height: 24.h),
          Divider(color: Colors.white.withOpacity(0.1)),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_outline,
                  color: Colors.white.withOpacity(0.7),
                  size: 18.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Private Journal',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      'Your reflections are safe and private',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.white.withOpacity(0.3),
                size: 24.w,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReflectionButton() {
    return Container(
      width: double.infinity,
      height: 54.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.r),
          child: Center(
            child: Text(
              'Start Writing',
              style: TextStyle(
                color: const Color(0xFF1E293B),
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
