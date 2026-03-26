import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../service/auth_service.dart';

class DependencyCreator {
  static Future<void> init() async {
    await GetStorage.init();

    // Add GetStorage to dependency system
    Get.put<GetStorage>(GetStorage(), permanent: true);
    Get.put<AuthService>(AuthService(), permanent: true);
  }
}
