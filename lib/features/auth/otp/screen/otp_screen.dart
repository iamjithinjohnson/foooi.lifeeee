import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/ww_auth_background.dart';
import '../../../../widgets/ww_pin_code_text_field.dart';
import '../controller/otp_controller.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WwAuthBackground(),

          // Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),

                  SizedBox(height: 40.h),

                  // Title
                  Text(
                    'Verify with OTP sent to\nyour number',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  SizedBox(height: 40.h),

                  // OTP Input
                  WwPinCodeField(onChanged: (value) {}, length: 6),

                  SizedBox(height: 40.h),

                  // Confirm Button with Gradient
                  GestureDetector(
                    onTap: controller.onConfirm,
                    child: Container(
                      width: double.infinity,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2B5AE1), Color(0xFF8A9A5B)],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
