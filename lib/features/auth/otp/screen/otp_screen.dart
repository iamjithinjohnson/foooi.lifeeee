import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/widgets/ww_primary_button.dart';
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
                  WwPrimaryButton(
                    onPressed: controller.onConfirm,
                    text: 'Confirm',
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
