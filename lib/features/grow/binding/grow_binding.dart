import 'package:get/get.dart';
import '../controller/grow_controller.dart';

class GrowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GrowController>(() => GrowController());
  }
}
