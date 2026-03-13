import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, color: Color(0xFF1E293B), size: 18.w),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Music and Calm',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 32.sp,
                  ),
            ),
          ),
          SizedBox(height: 24.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                _buildTab('All', true),
                _buildTab('Sleep and Calm', false),
                _buildTab('Windom', false),
                _buildTab('Loved', false),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: 8,
              itemBuilder: (context, index) {
                return _buildMusicItem(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF4D00) : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isSelected ? const Color(0xFFFF4D00) : const Color(0xFFE2E8F0),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF64748B),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildMusicItem(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/audio-player'),
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: const Color(0xFFA0A0A0),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(Icons.play_arrow, color: Colors.white, size: 32.w),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'When prayer feels fake',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '4 min',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF64748B),
                        ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: const Color(0xFF64748B)),
          ],
        ),
      ),
    );
  }
}
