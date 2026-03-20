import 'package:get/get.dart';
import '../controller/bible_ai_controller.dart';
import '../service/bible_ai_service.dart';

class BibleAiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BibleAiService>(() => BibleAiService());
    Get.lazyPut<BibleAiController>(() => BibleAiController());
  }
}
