import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../model/bible_ai_response.dart';
import '../service/bible_ai_service.dart';

enum SpeakStage { listening, processing, results }

class SpeakToGodController extends GetxController {
  final BibleAiService _service = Get.find<BibleAiService>();
  final SpeechToText _speech = SpeechToText();
  
  var stage = SpeakStage.listening.obs;
  var isListening = false.obs;
  var speechEnabled = false.obs;
  var recognizedText = "".obs;
  
  BibleAiResponse? response;

  @override
  void onInit() {
    super.onInit();
    _initSpeech();
  }

  void _initSpeech() async {
    speechEnabled.value = await _speech.initialize();
    startListening();
  }

  void startListening() async {
    if (speechEnabled.value && !isListening.value) {
      isListening.value = true;
      recognizedText.value = "";
      await _speech.listen(
        onResult: (result) {
          recognizedText.value = result.recognizedWords;
          if (result.finalResult) {
            isListening.value = false;
          }
        },
      );
    }
  }

  void stopListening() async {
    await _speech.stop();
    isListening.value = false;
  }

  void onTickPressed() async {
    if (recognizedText.value.trim().isEmpty) {
      Get.snackbar("Notice", "Please speak something first.");
      return;
    }
    
    stopListening();
    stage.value = SpeakStage.processing;
    
    try {
      final aiResponse = await _service.ask(recognizedText.value);
      response = BibleAiResponse.fromJson(aiResponse);
      stage.value = SpeakStage.results;
    } catch (e) {
      stage.value = SpeakStage.listening;
      Get.snackbar("Error", "Failed to get response from AI: $e");
    }
  }

  void retry() {
    response = null;
    recognizedText.value = "";
    stage.value = SpeakStage.listening;
    startListening();
  }
}
