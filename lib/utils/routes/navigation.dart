import 'package:get/get.dart';
import '../../features/auth/login/binding/login_binding.dart';
import '../../features/auth/login/screen/login_screen.dart';
import '../../features/auth/phone/binding/phone_binding.dart';
import '../../features/auth/phone/screen/phone_screen.dart';
import '../../features/auth/otp/binding/otp_binding.dart';
import '../../features/auth/otp/screen/otp_screen.dart';
import 'app_routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.PHONE,
      page: () => const PhoneScreen(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
    ),
  ];
}
