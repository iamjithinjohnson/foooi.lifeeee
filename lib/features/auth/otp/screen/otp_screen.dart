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
    final String phoneNumber = Get.arguments as String? ?? '';
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
                    'Verify with OTP',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 12.h),
                  if (phoneNumber.isNotEmpty)
                    Text(
                      'Sent to $phoneNumber',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: Colors.black54),
                    ),

                  SizedBox(height: 40.h),

                  // OTP Input
                  WwPinCodeField(
                    onChanged: (value) {},
                    length: 6,
                    pinController: controller.otpController,
                  ),

                  SizedBox(height: 30.h),

                  // Countdown Timer & Resend
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive the code? ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        if (controller.canResend.value)
                          GestureDetector(
                            onTap: controller.resendOtp,
                            child: Text(
                              "Resend",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          )
                        else
                          Text(
                            "00:${controller.timerCount.value.toString().padLeft(2, '0')}",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ),

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
