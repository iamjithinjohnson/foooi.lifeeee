import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatrimonyController extends GetxController {
  final formKey = GlobalKey<FormState>();
  
  var selectedGender = 'Male'.obs;
  var selectedInterests = <String>[].obs;
  
  final List<String> interestsList = [
    'Worship Music', 'Bible Study', 'Hiking', 'Cooking', 'Traveling', 'Volunteering', 'Gardening'
  ];

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

  void updateGender(String? gender) {
    if (gender != null) {
      selectedGender.value = gender;
    }
  }

  void createProfile() {
    if (formKey.currentState!.validate()) {
      Get.back();
      Get.snackbar(
        'Success',
        'Profile created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
