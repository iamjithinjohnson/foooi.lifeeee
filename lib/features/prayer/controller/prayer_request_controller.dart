import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrayerRequest {
  final String id;
  final String userName;
  final String userInitial;
  final String timeAgo;
  final String request;
  final RxInt prayedCount;
  final RxInt encourageCount;

  PrayerRequest({
    required this.id,
    required this.userName,
    required this.userInitial,
    required this.timeAgo,
    required this.request,
    int prayedCount = 0,
    int encourageCount = 0,
  })  : prayedCount = prayedCount.obs,
        encourageCount = encourageCount.obs;
}

class PrayerRequestController extends GetxController {
  final requestController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final prayerRequests = <PrayerRequest>[
    PrayerRequest(
      id: '1',
      userName: 'Sarah M.',
      userInitial: 'S',
      timeAgo: 'about 1 month ago',
      request:
          "Please pray for my mother who is going through surgery next week. We trust in God's healing hands.",
      prayedCount: 27,
      encourageCount: 2,
    ),
    PrayerRequest(
      id: '2',
      userName: 'James T.',
      userInitial: 'J',
      timeAgo: 'about 1 month ago',
      request:
          "I'm struggling with finding purpose in my career. Pray that God reveals His plan for me.",
      prayedCount: 18,
      encourageCount: 1,
    ),
    PrayerRequest(
      id: '3',
      userName: 'Maria G.',
      userInitial: 'M',
      timeAgo: 'about 1 month ago',
      request:
          "Pray for peace in my family. There has been conflict and I need God's wisdom to heal relationships.",
      prayedCount: 31,
      encourageCount: 2,
    ),
  ].obs;

  void shareRequest() {
    if (requestController.text.trim().isNotEmpty) {
      final newRequest = PrayerRequest(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userName: 'Me', // Should come from Auth service usually
        userInitial: 'M',
        timeAgo: 'just now',
        request: requestController.text.trim(),
      );
      prayerRequests.insert(0, newRequest);
      requestController.clear();
      Get.snackbar(
        'Success',
        'Prayer request shared successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void incrementPrayed(String id) {
    final request = prayerRequests.firstWhere((r) => r.id == id);
    request.prayedCount.value++;
  }

  void incrementEncourage(String id) {
    final request = prayerRequests.firstWhere((r) => r.id == id);
    request.encourageCount.value++;
  }

  @override
  void onClose() {
    requestController.dispose();
    super.onClose();
  }
}
