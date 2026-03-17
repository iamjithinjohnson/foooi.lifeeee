import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/routes/app_routes.dart';
import 'package:get/get.dart';
import '../controller/my_church_controller.dart';

class MyChurchScreen extends GetView<MyChurchController> {
  const MyChurchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
             CircleAvatar(
              radius: 16.r,
              backgroundColor: const Color(0xFFE2E8F0),
              child: Icon(Icons.church, size: 16.w, color: const Color(0xFF64748B)),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Church',
                  style: TextStyle(
                    color: const Color(0xFF0F172A),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Grace Community Church',
                  style: TextStyle(
                    color: const Color(0xFF64748B),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildAnnouncementBanner(),
            SizedBox(height: 20.h),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 2,
              children: [
                _buildQuickCard('Announcements', 'Church updates', Icons.notifications_none),
                _buildQuickCard('Events', 'Next: Morning Prayer Circl...', Icons.calendar_today_outlined),
                _buildQuickCard(
                  'Prayer Requests',
                  'Lift others up',
                  Icons.volunteer_activism_outlined,
                  onTap: () => Get.toNamed(Routes.PRAYER_REQUEST),
                ),
                _buildQuickCard('Directory', 'Church members', Icons.people_outline_rounded),
              ],
            ),
            SizedBox(height: 20.h),
            _buildPastorMessage(),
            SizedBox(height: 20.h),
            _buildCoursesBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFECF9FC), // Light teal background
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFD1EDF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.campaign_outlined, color: const Color(0xFF13768E), size: 16.w),
              SizedBox(width: 8.w),
              Text(
                'Latest Announcement',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF13768E),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            '🙏 Ash Wednesday Service',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F172A),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Join us for the Ash Wednesday service marking the beginning of Lent. Services at 7 AM, 12 PM, and 7 PM. Let us prepare our hearts together.',
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF64748B),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickCard(
    String title,
    String subtitle,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
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
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: const Color(0xFFEAB308),
                size: 18.w,
              ), // Golden color from image
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPastorMessage() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color(0xFFF1F5F9),
            child: Icon(Icons.person, color: const Color(0xFF94A3B8)),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Message from Pastor',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                Text(
                  'Pastor Michael Roberts',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF64748B),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Read this week\'s message →',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF13768E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chat_bubble_outline_rounded, color: const Color(0xFF94A3B8), size: 20.w),
        ],
      ),
    );
  }

  Widget _buildCoursesBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9C3).withOpacity(0.5), // Very light yellow/cream
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.library_books_outlined, color: const Color(0xFF854D0E), size: 16.w),
              SizedBox(width: 8.w),
              Text(
                'Church Courses',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF854D0E),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            'Explore Bible studies, marriage prep, and more',
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF854D0E).withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
