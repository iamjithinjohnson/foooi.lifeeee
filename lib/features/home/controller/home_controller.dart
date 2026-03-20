import 'package:get/get.dart';
import '../../bible_ai/service/bible_ai_service.dart';
import '../widgets/mood_result_dialog.dart';

class HomeController extends GetxController {
  final BibleAiService _aiService = BibleAiService();

  var selectedMoodIndex = (-1).obs;
  var isMoodCheckedIn = false.obs;

  // Scripture of the Day (independent)
  var scriptureOfTheDay =
      "The steadfast love of the Lord never ceases; his mercies never come to an end; they are new every morning; great is your faithfulness."
          .obs;
  var scriptureReference = "LAMENTATIONS 3:22-23".obs;
  var isLoadingDailyScripture = false.obs;

  // Mood Specific (for popup)
  var moodScripture = "".obs;
  var moodReference = "".obs;
  var isLoadingMoodResult = false.obs;

  final List<String> moods = ['Happy', 'Sad', 'Anxious', 'Tired', 'Angry'];

  @override
  void onInit() {
    super.onInit();
    fetchDailyScripture();
  }

  void selectMood(int index) async {
    selectedMoodIndex.value = index;
    final mood = moods[index];

    // Show loading popup immediately using the separate widget
    Get.dialog(
      MoodResultDialog(mood: mood),
      barrierDismissible: false,
    );

    await fetchScriptureForMood(mood);
    isMoodCheckedIn.value = true;
  }

  Future<void> fetchDailyScripture() async {
    try {
      isLoadingDailyScripture.value = true;
      // Fetch a general daily scripture
      final response = await _aiService.ask(
        "Please provide an inspiring 'Scripture of the Day' that brings hope and strength. Include the verse text and reference.",
      );

      if (response['verse'] != null) {
        scriptureOfTheDay.value = response['verse'];
        scriptureReference.value = response['reference'] ?? "BIBLE";
      }
    } catch (e) {
      print('Error fetching daily scripture: $e');
    } finally {
      isLoadingDailyScripture.value = false;
    }
  }

  Future<void> fetchScriptureForMood(String mood) async {
    try {
      isLoadingMoodResult.value = true;
      final response = await _aiService.ask(
        "I am feeling $mood today. Please provide a relevant Bible verse that offers guidance or comfort for this emotion. Include the verse text and reference.",
      );

      if (response['verse'] != null) {
        moodScripture.value = response['verse'];
        moodReference.value = response['reference'] ?? "BIBLE";
      }
    } catch (e) {
      print('Error fetching mood scripture: $e');
    } finally {
      isLoadingMoodResult.value = false;
    }
  }
}
