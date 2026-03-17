import 'package:get/get.dart';
import '../controller/my_church_controller.dart';

class MyChurchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyChurchController>(() => MyChurchController());
  }
}
