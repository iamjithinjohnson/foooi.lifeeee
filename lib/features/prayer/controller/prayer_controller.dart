import 'package:foi/utils/assets/svg_assets.dart';
import 'package:get/get.dart';

class PrayerController extends GetxController {
  var selectedTab = 0.obs; // 0 for Practice Hub, 1 for Your Journey

  final List<Map<String, String>> categories = [
    {'title': 'Financial Issues', 'icon': AssetsSvg.fearAndAnxiety},
    {'title': 'Relationship Stress', 'icon': AssetsSvg.friendshipDrama},
    {'title': 'Parenting', 'icon': AssetsSvg.familyConflict},
    {'title': 'Family', 'icon': AssetsSvg.feelingLonely},
    {'title': 'Work Stress', 'icon': AssetsSvg.examStress},
    {'title': 'Anger', 'icon': AssetsSvg.anger},
    {'title': 'Sleep & Nightmare', 'icon': AssetsSvg.sleepNightmare},
    {'title': 'Temptation', 'icon': AssetsSvg.temptation},
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
}
