import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerSection extends StatelessWidget {
  const PrayerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPrayerRequests(),
        SizedBox(height: 20.h),
        _buildAnsweredPrayer(),
      ],
    );
  }

  Widget _buildPrayerRequests() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.front_hand, color: Colors.orange, size: 16.sp),
              SizedBox(width: 8.w),
              Text(
                'PRAYER REQUESTS',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '2 people asked for prayer',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'From within your church',
            style: TextStyle(fontSize: 13.sp, color: Colors.black54),
          ),
          SizedBox(height: 20.h),
          _buildPrayerTile('Sarah M.', '12m ago'),
          _buildPrayerTile('Jimmy R.', '1h ago'),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(30.r),
            ),
            alignment: Alignment.center,
            child: Text(
              'Tap to view',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTile(String name, String time) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.orange,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
                Text(time, style: TextStyle(fontSize: 12.sp, color: Colors.black45)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnsweredPrayer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny, color: Colors.orange, size: 16.sp),
              SizedBox(width: 8.w),
              Text(
                'ANSWERED PRAYER',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '"My husband\'s health has improved! God is faithful."',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              CircleAvatar(
                radius: 12.r,
                backgroundColor: Colors.orange,
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sarah M.', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
                  Text('Prayed for 12 hours ago', style: TextStyle(fontSize: 10.sp, color: Colors.black45)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
