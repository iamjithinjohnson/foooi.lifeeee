import 'package:get/get.dart';
import '../../home/controller/home_controller.dart';
import '../../prayer/controller/prayer_controller.dart';
import '../../grow/controller/grow_controller.dart';
import '../../library/controller/library_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../../morning_night_routine/controller/user_progress_controller.dart';
import '../controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PrayerController>(() => PrayerController());
    Get.lazyPut<GrowController>(() => GrowController());
    Get.lazyPut<LibraryController>(() => LibraryController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<UserProgressController>(() => UserProgressController());
  }
}
