import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependencyCreator {
  static Future<void> init() async {
    await GetStorage.init();

    // Add GetStorage to dependency system
    Get.put<GetStorage>(GetStorage(), permanent: true);
  }
}
