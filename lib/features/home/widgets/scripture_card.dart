import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScriptureCard extends StatelessWidget {
  const ScriptureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2B5AE1), Color(0xFF0D21A1)],
        ),
      ),
      child: Stack(
        children: [
          // Background Illustration Pattern (Simulated with opacity)
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.church, size: 200, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SCRIPTURE OF THE DAY',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Icon(Icons.favorite_border, color: Colors.white),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'MATTHEW 6:34',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '"The steadfast love of the Lord never ceases; his mercies never come to an end; they are new every morning; great is your faithfulness."',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.4,
                    fontFamily: 'PP Cirka',
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          'Try a 5-min practice',
                          style: TextStyle(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF2B5AE1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        child: Text(
                          'Ask & more',
                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
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
}
