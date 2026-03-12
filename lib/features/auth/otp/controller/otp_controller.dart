import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();

  void onConfirm() {
    // Implement verification logic
    Get.snackbar('Auth', 'OTP Verified Successfully');
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
