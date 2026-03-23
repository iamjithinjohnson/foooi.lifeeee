import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foi/features/morning_night_routine/controller/user_progress_controller.dart';
import '../model/plan_session.dart';

class PlanDetailController extends GetxController {
  final UserProgressController progressController = Get.find<UserProgressController>();
  
  final RxList<PlanSession> sessions = <PlanSession>[].obs;
  final RxInt currentDayIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSessions();
  }

  void _loadSessions() {
    // Mock data for 7-day plan
    sessions.value = [
      PlanSession(
        id: 1,
        dayName: 'Day 1',
        title: 'When prayer feels fake',
        description: 'Understand that feelings are not the measure of your faith.',
        scripture: 'The Lord is near to all who call on him, to all who call on him in truth.',
        reflection: '“Prayer is not a performance; it\'s a presence.”',
        icon: Icons.menu_book,
        status: SessionStatus.active,
      ),
      PlanSession(
        id: 2,
        dayName: 'Day 2',
        title: 'Finding God in whispers',
        description: 'Learn to listen to the gentle voice of God.',
        scripture: 'After the earthquake a fire, but the Lord was not in the fire; and after the fire a sound of sheer silence.',
        reflection: '“Be still, and know that I am God.”',
        icon: Icons.graphic_eq,
        status: SessionStatus.locked,
      ),
      PlanSession(
        id: 3,
        dayName: 'Day 3',
        title: 'The Peace of God',
        description: 'Invite the Holy Spirit to fill your heart with calmness.',
        scripture: 'Peace I leave with you; my peace I give to you. Not as the world gives do I give to you.',
        reflection: '“His peace is your stronghold.”',
        icon: Icons.menu_book,
        status: SessionStatus.locked,
      ),
      PlanSession(
        id: 4,
        dayName: 'Day 4',
        title: 'Armor of Truth',
        description: 'Stand strong against doubt and insecurity.',
        scripture: 'Stand therefore, having fastened on the belt of truth...',
        reflection: '“Truth is your foundation.”',
        icon: Icons.shield,
        status: SessionStatus.locked,
      ),
      PlanSession(
        id: 5,
        dayName: 'Day 5',
        title: 'Resting in His Love',
        description: 'Find comfort in the unconditional love of Jesus.',
        scripture: 'Come to me, all who labor and are heavy laden, and I will give you rest.',
        reflection: '“Rest is a gift, not a reward.”',
        icon: Icons.favorite,
        status: SessionStatus.locked,
      ),
    ];
  }

  void completeSession(int index) {
    if (index < sessions.length) {
      sessions[index].status = SessionStatus.completed;
      progressController.addXp(5); // +5 XP reward
      
      // Unlock next session
      if (index + 1 < sessions.length) {
        sessions[index + 1].status = SessionStatus.active;
        currentDayIndex.value = index + 1;
      }
      
      sessions.refresh(); // Notify Obx
    }
  }
}
