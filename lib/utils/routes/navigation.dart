import 'package:get/get.dart';
import '../../features/auth/login/binding/login_binding.dart';
import '../../features/auth/login/screen/login_screen.dart';
import 'app_routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
