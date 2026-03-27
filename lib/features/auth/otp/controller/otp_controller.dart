import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../utils/routes/app_routes.dart';

class OtpController extends GetxController {
  // Use PinInputController as specified in the UI requirements
  // Note: This requires 'package:pin_code_fields/pin_code_fields.dart' to be correctly linked
  // or a compatible PinInputController to be available in the context.
  
  // Given the previous lint errors, we'll try to use PinInputController directly.
  final otpController = PinInputController();
  
  // Timer related
  RxInt timerCount = 30.obs;
  RxBool canResend = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    canResend.value = false;
    timerCount.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCount.value > 0) {
        timerCount.value--;
      } else {
        canResend.value = true;
        _timer?.cancel();
      }
    });
  }

  void resendOtp() {
    if (canResend.value) {
      // Logic for resending OTP
      startTimer();
    }
  }

  void onConfirm() {
    // Implement verification logic
    Get.offAllNamed(Routes.SETUP_PROFILE);
  }

  @override
  void onClose() {
    otpController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
