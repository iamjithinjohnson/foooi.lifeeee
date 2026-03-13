import 'package:get/get.dart';
import '../controller/prayer_controller.dart';

class PrayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayerController>(() => PrayerController());
  }
}
