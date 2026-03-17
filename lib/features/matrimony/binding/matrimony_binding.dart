import 'package:get/get.dart';
import '../controller/matrimony_controller.dart';

class MatrimonyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatrimonyController>(() => MatrimonyController());
  }
}
