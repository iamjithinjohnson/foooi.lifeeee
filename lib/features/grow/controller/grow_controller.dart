import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepModel {
  final String title;
  final int durationMinutes;

  StepModel({required this.title, required this.durationMinutes});
}

class RoutineModel {
  final String title;
  final String duration;
  final double progress;
  final String xp;
  final String streak;
  final Color color;
  final IconData icon;
  final String category;
  final List<StepModel> steps;

  RoutineModel({
    required this.title,
    required this.duration,
    required this.progress,
    required this.xp,
    required this.streak,
    required this.color,
    required this.icon,
    required this.category,
    this.steps = const [],
  });
}

class GrowController extends GetxController {
  final RxInt selectedTab = 0.obs;
  final RxList<RoutineModel> routines = <RoutineModel>[].obs;
  final RxString selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    // Default routines
    routines.addAll([
      RoutineModel(
        title: 'Morning Workout',
        duration: '5 min',
        progress: 0.8,
        xp: '+10XP',
        streak: '5 day streak',
        color: Colors.blue,
        icon: Icons.fitness_center,
        category: 'Health',
        steps: [
          StepModel(title: 'Stretch', durationMinutes: 1),
          StepModel(title: 'Excerise', durationMinutes: 3),
          StepModel(title: 'Breathe', durationMinutes: 1),
        ],
      ),
      RoutineModel(
        title: 'Prayer Time',
        duration: '10 min',
        progress: 0.4,
        xp: '+15XP',
        streak: '12 day streak',
        color: Colors.orange,
        icon: Icons.auto_stories,
        category: 'Faith',
        steps: [
          StepModel(title: 'Silent Prayer', durationMinutes: 3),
          StepModel(title: 'Bible Reading', durationMinutes: 5),
          StepModel(title: 'Journaling', durationMinutes: 2),
        ],
      ),
      RoutineModel(
        title: 'Read Scripture',
        duration: 'Daily',
        progress: 0.2,
        xp: '+20XP',
        streak: '0 day streak',
        color: Colors.green,
        icon: Icons.menu_book,
        category: 'Faith',
        steps: [
          StepModel(title: 'Select Chapter', durationMinutes: 1),
          StepModel(title: 'Read', durationMinutes: 5),
          StepModel(title: 'Reflect', durationMinutes: 2),
        ],
      ),
    ]);
  }

  void addRoutine(RoutineModel routine) {
    routines.add(routine);
    Get.snackbar(
      'Success',
      'Added to your routines 🌿',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      margin: const EdgeInsets.all(16),
      borderRadius: 16,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
