import 'package:get/get.dart';
import '../controller/bible_ai_controller.dart';

class BibleAiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BibleAiController>(() => BibleAiController());
  }
}
