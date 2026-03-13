import 'package:get/get.dart';
import '../../features/auth/login/binding/login_binding.dart';
import '../../features/auth/login/screen/login_screen.dart';
import '../../features/auth/phone/binding/phone_binding.dart';
import '../../features/auth/phone/screen/phone_screen.dart';
import '../../features/auth/otp/binding/otp_binding.dart';
import '../../features/auth/otp/screen/otp_screen.dart';
import '../../features/auth/setup_profile/binding/setup_profile_binding.dart';
import '../../features/auth/setup_profile/screen/setup_profile_screen.dart';
import '../../features/home/binding/home_binding.dart';
import '../../features/home/screen/home_screen.dart';
import '../../features/bible_ai/binding/bible_ai_binding.dart';
import '../../features/bible_ai/screen/bible_ai_screen.dart';
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
    GetPage(
      name: Routes.SETUP_PROFILE,
      page: () => const SetupProfileScreen(),
      binding: SetupProfileBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BIBLE_AI,
      page: () => const BibleAiScreen(),
      binding: BibleAiBinding(),
    ),
  ];
}
