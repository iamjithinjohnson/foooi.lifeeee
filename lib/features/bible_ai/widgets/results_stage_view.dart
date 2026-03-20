import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/routes/app_routes.dart';
import '../../../widgets/ww_primary_button.dart';
import '../controller/speak_to_god_controller.dart';

class ResultsStageView extends StatelessWidget {
  final SpeakToGodController controller;

  const ResultsStageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final response = controller.response;
    if (response == null) return const SizedBox();

    return SingleChildScrollView(
      key: const ValueKey("results"),
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.orange, size: 20.w),
                    SizedBox(width: 8.w),
                    Text(
                      "ENCOURAGEMENT FOR YOU",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  response.encouragement,
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.5,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 32.h),
                if (response.practicalAction.isNotEmpty) ...[
                  Text(
                    "Here are a few gentle steps you can take:",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontStyle: FontStyle.italic,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text("🌿", style: TextStyle(fontSize: 18.sp)),
                      SizedBox(width: 8.w),
                      Text(
                        "SMALL STEPS FORWARD",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2D6A4F),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    response.practicalAction,
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.6,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 48.h),
                ],
                WwPrimaryButton(
                  text: "Let’s Pray",
                  onPressed: () {
                    Get.toNamed(
                      Routes.PRAYER_CONTENT,
                      arguments: {
                        'title': '✨ A Prayer for You',
                        'description': 'A prayer for your current journey.',
                        'content': response.prayer,
                        'practical_action': response.practicalAction,
                        'verse': response.verse,
                        'reference': response.reference,
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),
                Center(
                  child: TextButton(
                    onPressed: controller.retry,
                    child: Text(
                      "Speak again",
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
