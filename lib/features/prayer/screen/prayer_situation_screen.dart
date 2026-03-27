import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import 'package:foi/utils/routes/app_routes.dart';

class PrayerSituationScreen extends StatefulWidget {
  const PrayerSituationScreen({super.key});

  @override
  State<PrayerSituationScreen> createState() => _PrayerSituationScreenState();
}

class _PrayerSituationScreenState extends State<PrayerSituationScreen> {
  final TextEditingController _situationController = TextEditingController();

  @override
  void dispose() {
    _situationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;
    final String? category = args?['category'];
    final bool hasCategory = category != null && category.isNotEmpty;

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
              decoration: BoxDecoration(
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
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF1F5F9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: const Color(0xFF1E293B),
                            size: 18.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        SizedBox(height: 100.h),
                        Text(
                          hasCategory
                              ? 'TELL GOD ABOUT YOUR ${category.toUpperCase()}'
                              : 'TELL GOD ABOUT YOUR SITUATION',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E293B),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          hasCategory
                              ? 'How are you feeling about your $category today?'
                              : 'What would you like prayer for today?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xFFF1F5F9),
                              width: 1.5,
                            ),
                          ),
                          child: TextField(
                            controller: _situationController,
                            maxLines: 8,
                            decoration: InputDecoration(
                              hintText: 'Share your thoughts, worries, or praises here...',
                              hintStyle: TextStyle(
                                color: const Color(0xFF94A3B8),
                                fontSize: 14.sp,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color(0xFF1E293B),
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 48.h),
                        WwPrimaryButton(
                          text: 'Get Spiritual Guidance',
                          onPressed: () {
                            if (_situationController.text.trim().isNotEmpty) {
                              Get.toNamed(
                                Routes.PRAYER_CONTENT,
                                arguments: {
                                  'title': hasCategory ? '✨ Prayer for $category' : '✨ Guidance for Your Situation',
                                  'description': hasCategory ? 'God has a word for what you’re feeling.' : 'Heavenly wisdom for what you’re walking through.',
                                  'content': 'Lord, we bring this specific situation before You. We ask for Your strength and peace to fill this heart. Give them wisdom to navigate these waters and trust in Your unfailing love. Amen.',
                                  'situation': _situationController.text.trim(),
                                },
                              );
                            } else {
                              Get.snackbar(
                                'Empty Input',
                                'Please share a little about your situation first.',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF94A3B8),
                                ),
                              ),
                            ),
                            const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        OutlinedButton(
                          onPressed: () => Get.toNamed(Routes.SPEAK_TO_GOD),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 56.h),
                            side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.mic_none_rounded, color: Colors.blue, size: 20.w),
                              SizedBox(width: 12.w),
                              Text(
                                'Speak to God',
                                style: TextStyle(
                                  color: const Color(0xFF1E293B),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
