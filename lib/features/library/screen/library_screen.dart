import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/utils/assets/svg_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controller/library_controller.dart';

class LibraryScreen extends GetView<LibraryController> {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 20.h),
            _buildSearchBar(),
            SizedBox(height: 16.h),
            _buildSavedVerses(),
            SizedBox(height: 32.h),
            _buildSectionHeader('Continue your Path'),
            _buildPathCard(),
            SizedBox(height: 32.h),
            _buildSectionHeader('Devotional Reads'),
            _buildDevotionalReads(),
            SizedBox(height: 32.h),
            _buildPlaylistsSection(),
            SizedBox(height: 32.h),
            _buildSectionHeader('Daily Sermons'),
            _buildSermons(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h,
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
            colors: [Colors.black.withOpacity(0.1), Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),
            SvgPicture.asset(AssetsSvg.praise, width: 44.w),
            SizedBox(height: 12.h),
            Text(
              'Library',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 36.sp,
                fontFamily: 'Playfair Display',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Worship, devotionals, and resources',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF64748B),
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for scenarios...',
            hintStyle: TextStyle(color: const Color(0xFF94A3B8), fontSize: 14.sp),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: const Color(0xFF64748B), size: 20.w),
            suffixIcon: Icon(Icons.mic_none, color: const Color(0xFF64748B), size: 20.w),
          ),
        ),
      ),
    );
  }

  Widget _buildSavedVerses() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Row(
          children: [
            const Text('🌤️', style: TextStyle(fontSize: 20)),
            SizedBox(width: 12.w),
            Text(
              'Saved Verses',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: const Color(0xFF1E293B),
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward, color: Colors.orange, size: 16.w),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF0F172A),
        ),
      ),
    );
  }

  Widget _buildPathCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: const DecorationImage(
            image: AssetImage(AssetsImage.bg_2),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: LinearGradient(
              colors: [const Color(0xFFC00060).withOpacity(0.8), const Color(0xFF9000C0).withOpacity(0.8)],
            ),
          ),
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CONTINUE YOUR PATH',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '7-Day Peace Plan — Day 3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.white.withOpacity(0.8), size: 16.w),
                  SizedBox(width: 4.w),
                  Text(
                    '7 min today • Resume',
                    style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13.sp),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
                    child: Icon(Icons.arrow_forward, color: Colors.white, size: 16.w),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDevotionalReads() {
    return SizedBox(
      height: 180.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          _buildDevotionalItem('Finding Rest in a Busy World', '7 MIN • PASTOR DAVID', AssetsImage.bg_1),
          _buildDevotionalItem('The Power of Prayers', '7 MIN • GENT', AssetsImage.bg_2),
        ],
      ),
    );
  }

  Widget _buildDevotionalItem(String title, String subtitle, String image) {
    return Container(
      width: 240.w,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          ),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.book, color: Colors.white, size: 24),
            const Spacer(),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylistsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F0E0),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PLAYLISTS',
              style: TextStyle(
                color: const Color(0xFF907040),
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Listen and Learn',
              style: TextStyle(
                color: const Color(0xFF402000),
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            _buildPlaylistItem('Peace & Stillness', '45 min', Colors.purple),
            _buildPlaylistItem('Focus & Study', '45 min', Colors.blue),
            _buildPlaylistItem('Sleep & Rest', '45 min', Colors.orange),
            _buildPlaylistItem('Joy & Praise', '45 min', Colors.red),
            _buildPlaylistItem('Morning Worship', '45 min', Colors.pink, isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylistItem(String title, String duration, Color color, {bool isLast = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 16.h),
      child: Row(
        children: [
          Container(
            width: 54.w,
            height: 54.w,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(colors: [color.withOpacity(0.6), color]),
            ),
            child: const Icon(Icons.play_arrow, color: Colors.white),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: const Color(0xFF402000)),
                ),
                Text(
                  duration,
                  style: TextStyle(color: const Color(0xFF907040), fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: const Color(0xFF907040), size: 24.w),
        ],
      ),
    );
  }

  Widget _buildSermons() {
    return SizedBox(
      height: 180.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          _buildSermonItem('Trusting God in Uncertainty', '7 MIN • PASTOR DAVID', AssetsImage.bg_1),
          _buildSermonItem('The Power of Prayers', '7 MIN • GENT', AssetsImage.bg_2),
        ],
      ),
    );
  }

  Widget _buildSermonItem(String title, String subtitle, String image) {
    return Container(
      width: 240.w,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          ),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 18),
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11.sp),
            ),
          ],
        ),
      ),
    );
  }
}
