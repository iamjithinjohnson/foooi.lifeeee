import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:foi/features/bible_ai/service/bible_ai_service.dart';
import 'user_progress_controller.dart';

class NightRoutineController extends GetxController {
  final isStarted = false.obs;
  final currentStepIndex = 0.obs;
  final isCompleted = false.obs;
  final scrollController = ScrollController();
  final FlutterTts flutterTts = FlutterTts();
  final BibleAiService _bibleAiService = BibleAiService();
  final UserProgressController _userProgress = Get.find<UserProgressController>();

  // Step state
  final gratitude = "".obs;
  final currentPrayer = "".obs;
  final isStepLoading = false.obs;
  final earnedSessionXp = 0.obs;

  final List<String> steps = [
    'Reflect on your day',
    'Name one thing you\'re grateful for',
    'Read Psalm 4:8',
    'Rest in God\'s peace',
  ];

  final List<int> stepXpValues = [2, 2, 3, 1];

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(0.9);
    await flutterTts.setSpeechRate(0.35);
  }

  void startRoutine() {
    isStarted.value = true;
    currentStepIndex.value = 0;
    isCompleted.value = false;
    earnedSessionXp.value = 0;
  }

  void nextStep() {
    // Award XP for current step
    final int stepXp = stepXpValues[currentStepIndex.value];
    earnedSessionXp.value += stepXp;
    _userProgress.addXp(stepXp);

    if (currentStepIndex.value < steps.length - 1) {
      currentStepIndex.value++;
      _scrollToCurrentStep();
      _handleStepSpecificLogic();
    } else {
      completeRoutine();
    }
  }

  void _handleStepSpecificLogic() {
    if (currentStepIndex.value == 3) {
      // Step 4: Rest in peace - Prayer
      _generateNightPrayer();
    }
  }

  Future<void> _generateNightPrayer() async {
    isStepLoading.value = true;
    try {
      final response = await _bibleAiService.ask("Write a short, peaceful night prayer (2 sentences). Context: Resting in God's presence, releasing the day's burdens.");
      currentPrayer.value = response['encouragement'] ?? response['prayer'] ?? "In peace I will lie down and sleep, for you alone, LORD, make me dwell in safety. Amen.";
      flutterTts.speak(currentPrayer.value);
    } catch (e) {
      currentPrayer.value = "In peace I will lie down and sleep, for you alone, LORD, make me dwell in safety. Amen.";
      flutterTts.speak(currentPrayer.value);
    } finally {
      isStepLoading.value = false;
    }
  }

  void saveGratitude(String val) {
    gratitude.value = val;
    nextStep();
  }

  void completeStep3() {
    nextStep();
  }

  void completeRoutine() {
    // Award Completion Bonus
    earnedSessionXp.value += 2;
    _userProgress.addXp(2);
    _userProgress.markNightComplete();
    isCompleted.value = true;
  }

  void _scrollToCurrentStep() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        currentStepIndex.value * 140.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void reset() {
    isStarted.value = false;
    currentStepIndex.value = 0;
    isCompleted.value = false;
    gratitude.value = "";
    flutterTts.stop();
  }

  @override
  void dispose() {
    scrollController.dispose();
    flutterTts.stop();
    super.dispose();
  }
}
