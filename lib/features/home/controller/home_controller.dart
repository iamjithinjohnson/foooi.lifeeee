import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedMoodIndex = (-1).obs;

  final List<String> moods = ['Happy', 'Sad', 'Anxious', 'Tired', 'Angry'];
  
  void selectMood(int index) {
    selectedMoodIndex.value = index;
  }
}
