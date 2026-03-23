import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:foi/features/bible_ai/service/bible_ai_service.dart';
import 'user_progress_controller.dart';

class MorningRoutineController extends GetxController {
  final isStarted = false.obs;
  final currentStepIndex = 0.obs;
  final isCompleted = false.obs;
  final scrollController = ScrollController();
  final FlutterTts flutterTts = FlutterTts();
  final BibleAiService _bibleAiService = BibleAiService();
  final UserProgressController _userProgress = Get.find<UserProgressController>();

  // Breathing logic
  final breathingCycle = 0.obs;
  final isInhaling = true.obs;
  final breathingText = "Inhale...".obs;

  // Step state
  final currentPrayer = "".obs;
  final intention = "".obs;
  final isStepLoading = false.obs;
  final earnedSessionXp = 0.obs;

  final List<String> steps = [
    'Take 3 deep breaths',
    'Thank God for the new day',
    'Read today\'s scripture',
    'Set one intention for the day',
  ];

  final List<int> stepXpValues = [1, 2, 3, 2];

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);
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
    if (currentStepIndex.value == 1) {
      _generatePrayer();
    }
  }

  Future<void> _generatePrayer() async {
    isStepLoading.value = true;
    try {
      final response = await _bibleAiService.ask("Write a short, grateful morning prayer (2 sentences). Context: Starting a new day with God's grace.");
      currentPrayer.value = response['encouragement'] ?? response['prayer'] ?? "Lord, thank You for this morning and Your new mercies. Guide my heart today. Amen.";
      flutterTts.speak(currentPrayer.value);
    } catch (e) {
      currentPrayer.value = "Lord, thank You for this morning and Your new mercies. Guide my heart today. Amen.";
      flutterTts.speak(currentPrayer.value);
    } finally {
      isStepLoading.value = false;
    }
  }

  void completeStep3() {
    nextStep();
  }

  void saveIntention(String val) {
    intention.value = val;
    nextStep();
  }

  void completeRoutine() {
    // Award Completion Bonus
    earnedSessionXp.value += 2;
    _userProgress.addXp(2);
    _userProgress.markMorningComplete();
    isCompleted.value = true;
  }

  void _scrollToCurrentStep() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        currentStepIndex.value * 140.0, // Increased for expansion
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void reset() {
    isStarted.value = false;
    currentStepIndex.value = 0;
    isCompleted.value = false;
    breathingCycle.value = 0;
    intention.value = "";
    flutterTts.stop();
  }

  @override
  void dispose() {
    scrollController.dispose();
    flutterTts.stop();
    super.dispose();
  }
}
