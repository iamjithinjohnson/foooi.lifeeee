import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/routes/app_routes.dart';
import 'package:get/get.dart';

class CitoCommunityScreen extends StatelessWidget {
  const CitoCommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'CITO Community',
          style: TextStyle(
            color: const Color(0xFF0F172A),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Strengthening Christian economic collaboration',
              style: TextStyle(
                color: const Color(0xFF64748B),
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 24.h),
            _buildSpecialCard(
              iconPath: '🌍',
              title: 'One World, One Faith, One Community',
              subtitle: 'Connect with fellow Christians for business, careers, innovation, and life partnerships.',
              backgroundColor: const Color(0xFFEFF6FF),
            ),
            SizedBox(height: 16.h),
            _buildCommunityItem(
              icon: Icons.business_center_outlined,
              title: 'Business Network',
              subtitle: 'Connect with Christian businesses',
              onTap: () => Get.toNamed(Routes.BUSINESS_NETWORK),
            ),
            SizedBox(height: 12.h),
            _buildCommunityItem(
              icon: Icons.search,
              title: 'CITO Jobs',
              subtitle: 'Find or post opportunities',
              onTap: () => Get.toNamed(Routes.JOBS),
            ),
            SizedBox(height: 12.h),
            _buildCommunityItem(
              icon: Icons.lightbulb_outline,
              title: 'Incubation & Innovation',
              subtitle: 'Submit and fund startups',
              onTap: () => Get.toNamed(Routes.INCUBATION_INNOVATION),
            ),
            SizedBox(height: 12.h),
            _buildCommunityItem(
              icon: Icons.favorite_border,
              title: 'CITO Matrimony',
              subtitle: 'Find your life partner',
              onTap: () => Get.toNamed(Routes.MATRIMONY),
            ),
            SizedBox(height: 24.h),
            _buildSpecialCard(
              iconPath: '👥',
              title: 'Community Groups',
              subtitle: 'Join faith-based groups and connect with others',
              backgroundColor: const Color(0xFFF1F5F9),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialCard({
    required String iconPath,
    required String title,
    required String subtitle,
    required Color backgroundColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(iconPath, style: TextStyle(fontSize: 20.sp)),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF64748B),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: const Color(0xFFEAB308), size: 24.w),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: const Color(0xFFCBD5E1), size: 20.w),
          ],
        ),
      ),
    );
  }
}
