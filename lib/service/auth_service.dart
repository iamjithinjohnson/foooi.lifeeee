import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/routes/app_routes.dart';

class AuthService extends GetxService {
  final _storage = Get.find<GetStorage>();
  final _isLoggedIn = false.obs;

  bool get isLoggedIn => _isLoggedIn.value;

  static const String _isLoggedInKey = 'is_logged_in';

  @override
  void onInit() {
    super.onInit();
    _isLoggedIn.value = _storage.read(_isLoggedInKey) ?? false;
  }

  void login() {
    _isLoggedIn.value = true;
    _storage.write(_isLoggedInKey, true);
  }

  void logout() {
    _isLoggedIn.value = false;
    _storage.write(_isLoggedInKey, false);
    Get.offAllNamed(Routes.LOGIN);
  }
}
