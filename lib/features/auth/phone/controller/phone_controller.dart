import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/routes/app_routes.dart';

class PhoneController extends GetxController {
  final phoneController = TextEditingController();

  // You might want to store selected country code here
  String countryCode = '+1';

  void onContinue() {
    // Navigate to OTP with phone number as argument
    Get.toNamed(Routes.OTP, arguments: countryCode + phoneController.text);
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
