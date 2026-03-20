import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../model/bible_ai_response.dart';
import '../service/bible_ai_service.dart';

class Message {
  final String text;
  final bool isUser;
  final String? type; // 'text', 'verse', 'encouragement', 'prayer', 'action'
  final String? reference;
  final String time;

  Message({
    required this.text,
    required this.isUser,
    this.type = 'text',
    this.reference,
    required this.time,
  });
}

class BibleAiController extends GetxController {
  final BibleAiService _service = Get.find<BibleAiService>();
  var messages = <Message>[].obs;
  var isTextEmpty = true.obs;
  var isLoading = false.obs;
  final TextEditingController textController = TextEditingController();
  
  final SpeechToText _speech = SpeechToText();
  var isListening = false.obs;
  var speechEnabled = false.obs;

  final List<String> suggestionTexts = [
    'What does God want me to know today?',
    'Can you help me understand a Bible verse?',
    'I’m feeling overwhelmed — what can I pray?',
    'Give me guidance for a decision I’m facing',
  ];

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      isTextEmpty.value = textController.text.trim().isEmpty;
    });
    _initSpeech();
  }

  void _initSpeech() async {
    speechEnabled.value = await _speech.initialize();
  }

  void startListening() async {
    if (speechEnabled.value && !isListening.value) {
      isListening.value = true;
      await _speech.listen(
        onResult: (result) {
          textController.text = result.recognizedWords;
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

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userTime = DateFormat.jm().format(DateTime.now());
    messages.add(Message(
      text: text,
      isUser: true,
      time: userTime,
    ));
    textController.clear();
    isLoading.value = true;

    try {
      final aiResponse = await _service.ask(text);
      final aiTime = DateFormat.jm().format(DateTime.now());
      final responseModel = BibleAiResponse.fromJson(aiResponse);

      // AI Text Responses (Encouragement, Prayer, Action)
      if (responseModel.encouragement.isNotEmpty) {
        messages.add(Message(
          text: responseModel.encouragement,
          isUser: false,
          type: 'encouragement',
          time: aiTime,
        ));
      }

      if (responseModel.prayer.isNotEmpty) {
        messages.add(Message(
          text: responseModel.prayer,
          isUser: false,
          type: 'prayer',
          time: aiTime,
        ));
      }

      if (responseModel.practicalAction.isNotEmpty) {
        messages.add(Message(
          text: responseModel.practicalAction,
          isUser: false,
          type: 'action',
          time: aiTime,
        ));
      }

      // Bible Verse Card
      if (responseModel.verse.isNotEmpty) {
        messages.add(Message(
          text: responseModel.verse,
          isUser: false,
          type: 'verse',
          reference: responseModel.reference,
          time: aiTime,
        ));
      }
    } catch (e) {
      debugPrint('Bible AI Error: $e');
      Get.snackbar(
        'Error',
        'Bible AI Error: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
