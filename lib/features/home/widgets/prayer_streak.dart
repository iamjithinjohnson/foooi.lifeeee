import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerStreak extends StatelessWidget {
  const PrayerStreak({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/bg_1.png'), // Should be a soft floral background
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.green.withOpacity(0.3), Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.spa, color: Colors.green, size: 24.w),
                SizedBox(width: 8.w),
                Text(
                  "You've prayed",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F2109),
                  ),
                ),
              ],
            ),
            Text(
              "4 days this week",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0D21A1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
