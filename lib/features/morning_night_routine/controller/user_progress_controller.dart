import 'package:get/get.dart';

class UserProgressController extends GetxController {
  final totalXp = 0.obs;
  final morningCompletedToday = false.obs;
  final nightCompletedToday = false.obs;
  final dailyBonusClaimed = false.obs;

  void addXp(int xp) {
    totalXp.value += xp;
  }

  void markMorningComplete() {
    morningCompletedToday.value = true;
    _checkDailyBonus();
  }

  void markNightComplete() {
    nightCompletedToday.value = true;
    _checkDailyBonus();
  }

  void _checkDailyBonus() {
    if (morningCompletedToday.value && nightCompletedToday.value && !dailyBonusClaimed.value) {
      addXp(5); // +5 XP bonus for full completion
      dailyBonusClaimed.value = true;
      Get.snackbar(
        '🌞 Daily Goal Met!',
        'You earned an extra +5 XP for completing both routines!',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void resetDailyProgress() {
    morningCompletedToday.value = false;
    nightCompletedToday.value = false;
    dailyBonusClaimed.value = false;
  }
}
