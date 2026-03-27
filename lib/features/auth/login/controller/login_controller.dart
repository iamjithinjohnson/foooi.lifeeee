import 'package:flutter/widgets.dart';
import '../../../../utils/assets/image_assets.dart';
import 'package:get/get.dart';
import '../../../../utils/routes/app_routes.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Precache heavy background image for the next screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.context != null) {
        precacheImage(const AssetImage(AssetsImage.bg_2), Get.context!);
      }
    });
  }

  void onGoogleSignIn() {
    // Implement Google Sign In
  }

  void onAppleSignIn() {
    // Implement Apple Sign In
  }

  void onContinueWithPhone() {
    Get.toNamed(Routes.PHONE);
  }
}
