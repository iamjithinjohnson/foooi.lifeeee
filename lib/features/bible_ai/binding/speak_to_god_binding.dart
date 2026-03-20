import 'package:get/get.dart';
import '../controller/speak_to_god_controller.dart';
import '../service/bible_ai_service.dart';

class SpeakToGodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeakToGodController>(() => SpeakToGodController());
    Get.lazyPut(() => BibleAiService());
  }
}
