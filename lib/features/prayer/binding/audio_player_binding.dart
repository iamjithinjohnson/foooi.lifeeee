import 'package:get/get.dart';
import '../controller/audio_player_controller.dart';

class AudioPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioPlayerController>(() => AudioPlayerController());
  }
}
