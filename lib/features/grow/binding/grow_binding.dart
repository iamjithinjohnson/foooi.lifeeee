import 'package:get/get.dart';
import '../controller/grow_controller.dart';
import '../controller/plan_detail_controller.dart';
import '../../morning_night_routine/controller/user_progress_controller.dart';

class GrowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProgressController>(() => UserProgressController());
    Get.lazyPut<GrowController>(() => GrowController());
    Get.lazyPut<PlanDetailController>(() => PlanDetailController());
  }
}
