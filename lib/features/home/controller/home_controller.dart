import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedMoodIndex = (-1).obs;
  var bottomNavIndex = 0.obs;

  final List<String> moods = ['Happy', 'Sad', 'Anxious', 'Tired', 'Angry'];
  final List<String> moodEmojis = ['😊', '😔', '😟', '😴', '😡'];

  void selectMood(int index) {
    selectedMoodIndex.value = index;
  }

  void changeTab(int index) {
    bottomNavIndex.value = index;
  }
}
