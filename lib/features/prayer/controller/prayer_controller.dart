import 'package:foi/utils/assets/svg_assets.dart';
import 'package:get/get.dart';

class PrayerController extends GetxController {
  var selectedTab = 0.obs; // 0 for Practice Hub, 1 for Your Journey

  final List<Map<String, String>> categories = [
    {'title': 'Exam Stress', 'icon': AssetsSvg.examStress},
    {'title': 'Family Conflict', 'icon': AssetsSvg.familyConflict},
    {'title': 'Feeling Lonely', 'icon': AssetsSvg.feelingLonely},
    {'title': 'Fear and Anxiety', 'icon': AssetsSvg.fearAndAnxiety},
    {'title': 'Anger', 'icon': AssetsSvg.anger},
    {'title': 'Friendship Drama', 'icon': AssetsSvg.friendshipDrama},
    {'title': 'Temptation', 'icon': AssetsSvg.temptation},
    {'title': 'Sleep & Nightmare', 'icon': AssetsSvg.sleepNightmare},
  ];

  final List<Map<String, dynamic>> journeyItems = [
    {
      'title': 'Making space for doubt',
      'subtitle': '7 min • Gentle • +5XP',
      'isCompleted': true,
      'isLocked': false,
    },
    {
      'title': 'Making space for doubt',
      'subtitle': '7 min • Gentle • +5XP',
      'isCompleted': false,
      'isLocked': false,
    },
    {
      'title': 'Making space for doubt',
      'subtitle': '7 min • Gentle • +5XP',
      'isCompleted': false,
      'isLocked': true,
    },
    {
      'title': 'Making space for doubt',
      'subtitle': '7 min • Gentle • +5XP',
      'isCompleted': false,
      'isLocked': true,
    },
    {
      'title': 'Making space for doubt',
      'subtitle': '7 min • Gentle • +5XP',
      'isCompleted': false,
      'isLocked': true,
    },
  ];

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void changeBottomTab(int index) {
    if (index == 0) {
      Get.offAllNamed('/home');
    } else if (index == 1) {
      // Already here
    } else if (index == 2) {
      Get.toNamed('/grow');
    } else if (index == 3) {
      Get.toNamed('/library');
    } else if (index == 4) {
      Get.toNamed('/profile');
    }
  }
}
