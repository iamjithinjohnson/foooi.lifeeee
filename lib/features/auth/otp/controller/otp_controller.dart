import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/routes/app_routes.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();

  void onConfirm() {
    // Implement verification logic
    Get.offAllNamed(Routes.SETUP_PROFILE);
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
