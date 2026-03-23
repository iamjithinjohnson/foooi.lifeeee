import 'package:get/get.dart';
import '../controller/morning_routine_controller.dart';
import '../controller/night_routine_controller.dart';
import '../controller/user_progress_controller.dart';

class MorningNightRoutineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MorningRoutineController>(() => MorningRoutineController());
    Get.lazyPut<NightRoutineController>(() => NightRoutineController());
    Get.put<UserProgressController>(UserProgressController(), permanent: true);
  }
}
