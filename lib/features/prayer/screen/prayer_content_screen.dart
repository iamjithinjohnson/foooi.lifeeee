import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/widgets/ww_gradient_button.dart';

class PrayerContentScreen extends StatelessWidget {
  const PrayerContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsImage.bg_2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF1E293B),
                            size: 18.w,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.save_outlined, size: 18.w),
                            SizedBox(width: 8.w),
                            Text(
                              'Save',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  'EXAM STRESS',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Text(
                    'Take a deep breath. Let these words settle in your heart.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Icon(
                          Icons.format_quote,
                          size: 60.w,
                          color: const Color(0xFFE2E8F0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, left: 10.w),
                        child: Text(
                          'Lord, I come to You in this moment of need. I release my worries and anxieties into Your hands. Fill me with Your peace that surpasses all understanding. Guide my steps today and help me trust in Your perfect plan. In Jesus\' name, Amen.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                fontSize: 24.sp,
                                height: 1.4,
                                color: const Color(0xFF0F172A),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: WwGradientButton(
                    text: 'Amen. I’m Done',
                    onTap: () => Get.back(),
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
