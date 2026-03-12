import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupProfileController extends GetxController {
  final nameController = TextEditingController();
  final pageController = PageController();
  
  var currentStep = 0.obs;
  final int totalSteps = 10;

  var selectedAgeGroup = ''.obs;
  var selectedGender = ''.obs;
  var selectedDenomination = ''.obs;
  var selectedBibleVersion = ''.obs;
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
      currentStep.value++;
      pageController.animateToPage(
        currentStep.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
      pageController.animateToPage(
        currentStep.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.back();
    }
  }

  double get progress => (currentStep.value + 1) / totalSteps;

  @override
  void onClose() {
    nameController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
