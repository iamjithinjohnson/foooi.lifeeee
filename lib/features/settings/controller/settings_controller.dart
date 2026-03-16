import 'package:get/get.dart';

class SettingsController extends GetxController {
  // Profile Mode
  final RxString selectedProfileMode = 'Teen'.obs;
  final List<Map<String, String>> profileModes = [
    {'title': 'Kid', 'age': '8-12'},
    {'title': 'Teen', 'age': '13-19'},
    {'title': 'Adult', 'age': '20+'},
  ];

  // Bible Version
  final RxString selectedBibleVersion = 'ESV'.obs;
  final List<String> bibleVersions = ['NIV', 'ESV', 'NKJV', 'KJV', 'NLT'];

  // Notifications
  final RxBool prayerReminders = false.obs;
  final RxBool prayerRequests = false.obs;
  final RxBool dailyScripture = false.obs;
  final RxBool events = false.obs;

  // Privacy and Community
  final RxBool prayerCircles = false.obs;
  final RxBool sharePrayerLink = false.obs;
  final RxBool leaderMode = false.obs;

  // Language
  final RxString selectedLanguage = 'English'.obs;

  void setProfileMode(String mode) => selectedProfileMode.value = mode;
  void setBibleVersion(String version) => selectedBibleVersion.value = version;
  
  void togglePrayerReminders(bool value) => prayerReminders.value = value;
  void togglePrayerRequests(bool value) => prayerRequests.value = value;
  void toggleDailyScripture(bool value) => dailyScripture.value = value;
  void toggleEvents(bool value) => events.value = value;

  void togglePrayerCircles(bool value) => prayerCircles.value = value;
  void toggleSharePrayerLink(bool value) => sharePrayerLink.value = value;
  void toggleLeaderMode(bool value) => leaderMode.value = value;
}
