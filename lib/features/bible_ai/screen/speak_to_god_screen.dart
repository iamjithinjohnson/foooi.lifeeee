import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/speak_to_god_controller.dart';
import '../widgets/listening_stage_view.dart';
import '../widgets/processing_stage_view.dart';
import '../widgets/results_stage_view.dart';
import '../widgets/speak_to_god_header.dart';

class SpeakToGodScreen extends GetView<SpeakToGodController> {
  const SpeakToGodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE0F2F1), Colors.white, Color(0xFFF3E5F5)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SpeakToGodHeader(),
              Expanded(
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: _buildStageContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStageContent() {
    switch (controller.stage.value) {
      case SpeakStage.listening:
        return ListeningStageView(controller: controller);
      case SpeakStage.processing:
        return const ProcessingStageView();
      case SpeakStage.results:
        return ResultsStageView(controller: controller);
    }
  }
}
