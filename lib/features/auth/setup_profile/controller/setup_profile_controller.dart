import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../service/auth_service.dart';
import '../../../../utils/routes/app_routes.dart';

class SetupProfileController extends GetxController {
  final nameController = TextEditingController();
  final pageController = PageController();
  
  var currentStep = 0.obs;
  final int totalSteps = 6; // Reduced after removing Church screen

  var selectedGuidance = ''.obs;
  var selectedDate = ''.obs;
  var selectedDay = ''.obs;
  var selectedMonth = ''.obs;
  var selectedYear = ''.obs;
  var selectedGender = ''.obs;
  var selectedDenomination = ''.obs;
  var isProtestantExpanded = false.obs; // For sub-options visibility
  var selectedStressLevel = ''.obs;
  var selectedGoals = <String>[].obs;

  void toggleGoal(String goal) {
    if (selectedGoals.contains(goal)) {
      selectedGoals.remove(goal);
    } else {
      selectedGoals.add(goal);
    }
  }

  var locationPermission = false.obs;
  var contactsPermission = false.obs;

  void nextStep() {
    if (currentStep.value < totalSteps - 1) {
      if (currentStep.value == 1 && selectedGuidance.value != 'I’d like to choose a specific denomination') {
        // Skip Denomination (Step 2) if not Customize
        currentStep.value = 3;
      } else {
        currentStep.value++;
      }
      pageController.animateToPage(
        currentStep.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      if (currentStep.value == 3 && selectedGuidance.value != 'I’d like to choose a specific denomination') {
        // Go back to Guidance from Goals if Denomination was skipped
        currentStep.value = 1;
      } else {
        currentStep.value--;
      }
      pageController.animateToPage(
        currentStep.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.back();
    }
  }

  void finishSetup() {
    Get.find<AuthService>().login();
    Get.offAllNamed(Routes.MAIN);
  }

  double get progress => (currentStep.value + 1) / totalSteps;

  @override
  void onClose() {
    nameController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
