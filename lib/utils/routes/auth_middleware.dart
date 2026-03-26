import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/auth_service.dart';
import 'app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();

    if (authService.isLoggedIn) {
      if (route == Routes.LOGIN || route == Routes.PHONE || route == Routes.OTP || route == Routes.SETUP_PROFILE) {
        return const RouteSettings(name: Routes.MAIN);
      }
    } else {
      if (route != Routes.LOGIN && route != Routes.PHONE && route != Routes.OTP && route != Routes.SETUP_PROFILE) {
        return const RouteSettings(name: Routes.LOGIN);
      }
    }

    return null;
  }
}
