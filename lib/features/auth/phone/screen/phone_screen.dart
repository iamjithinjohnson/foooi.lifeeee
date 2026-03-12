import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/assets/image_assets.dart';
import '../../../../widgets/ww_auth_background.dart';
import '../../../../widgets/ww_country_picker/ww_country_picker_auth.dart';
import '../controller/phone_controller.dart';

class PhoneScreen extends GetView<PhoneController> {
  const PhoneScreen({super.key});

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
                    'Enter Your Phone\nNumber to get OTP',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  SizedBox(height: 40.h),

                  // Phone Input
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: const Color(0xFFE8ECEF)),
                    ),
                    child: WwTextFieldPhonePicker(
                      onChanged: (code, maxLength) {
                        controller.countryCode = code.dialCode ?? '+1';
                      },
                      controller: controller.phoneController,
                      hintText: 'Phone Number',
                      enableBorder: false,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Continue Button with Gradient
                  GestureDetector(
                    onTap: controller.onContinue,
                    child: Container(
                      width: double.infinity,
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF2B5AE1),
                            Color(
                              0xFF8A9A5B,
                            ), // Approximating the brownish/gold tint at bottom
                          ],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Terms Text
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                        children: [
                          const TextSpan(text: 'by clicking, I accept the '),
                          TextSpan(
                            text: 'terms of service',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'privacy policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
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
