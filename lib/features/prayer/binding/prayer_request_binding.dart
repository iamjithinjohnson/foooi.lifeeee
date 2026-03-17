import 'package:get/get.dart';
import '../controller/prayer_request_controller.dart';

class PrayerRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayerRequestController>(() => PrayerRequestController());
  }
}
