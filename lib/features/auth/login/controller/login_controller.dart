import 'package:get/get.dart';
import '../../../../utils/routes/app_routes.dart';

class LoginController extends GetxController {
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
