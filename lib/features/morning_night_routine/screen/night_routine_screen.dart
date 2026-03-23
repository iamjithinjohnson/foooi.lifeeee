import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/utils/app_colors.dart';
import 'package:foi/features/morning_night_routine/controller/night_routine_controller.dart';
import 'package:foi/utils/routes/app_routes.dart';
import '../widgets/routine_header.dart';
import '../widgets/routine_step_card.dart';
import '../widgets/routine_action_button.dart';
import '../widgets/routine_completion_view.dart';

class NightRoutineScreen extends GetView<NightRoutineController> {
  const NightRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCompleted.value) {
        return RoutineCompletionView(
          title: 'A peaceful night',
          description: 'Take a moment to carry this peace into your sleep.',
          topIcon: Icons.self_improvement_rounded,
          earnedXp: controller.earnedSessionXp.value,
          streakValue: '5 Days',
          buttonText: 'Done & Ready to Sleep',
          themeColor: Colors.indigo,
          onDone: () {
            controller.reset();
            Get.back();
          },
        );
      }
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Header Image with Gradient
            _buildBackgroundHeader(),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoutineHeader(
                    onClose: () {
                      controller.reset();
                      Get.back();
                    },
                    isStarted: controller.isStarted.value,
                    currentStep: controller.currentStepIndex.value + 1,
                    totalSteps: controller.steps.length,
                    themeColor: Colors.indigo,
                  ),
                  if (!controller.isStarted.value) _buildIntroSection(context),
                  Expanded(child: _buildStepsList(context)),
                  if (!controller.isStarted.value) 
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: RoutineActionButton(
                      text: '✨ Start Night Routine',
                      color: Colors.indigo,
                      onTap: () => controller.startRoutine(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBackgroundHeader() {
    return Positioned(
      top: 0, left: 0, right: 0,
      height: 350.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsImage.night_bg),
            fit: BoxFit.cover,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.05),
                Colors.blueGrey.withOpacity(0.4),
                Colors.white,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Night Routine',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
          ),
          SizedBox(height: 8.h),
          Text(
            'End your day in God\'s presence.',
            style: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildStepsList(BuildContext context) {
    return ListView.builder(
      controller: controller.scrollController,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      itemCount: controller.steps.length,
      itemBuilder: (context, index) {
        return Obx(() {
          final bool isActive = controller.isStarted.value && controller.currentStepIndex.value == index;
          final bool isDone = controller.isStarted.value && controller.currentStepIndex.value > index;

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: controller.isStarted.value ? (isActive ? 1.0 : (isDone ? 0.7 : 0.4)) : 1.0,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: isActive ? 1.02 : 1.0,
              child: RoutineStepCard(
                index: index,
                title: controller.steps[index],
                isActive: isActive,
                isDone: isDone,
                themeColor: Colors.indigo,
                content: isActive ? _buildActiveStepContent(index) : null,
              ),
            ),
          );
        });
      },
    );
  }

  Widget _buildActiveStepContent(int index) {
    switch (index) {
      case 0: return _buildReflectionContent();
      case 1: return _buildGratitudeContent();
      case 2: return _buildReadScriptureContent();
      case 3: return _buildRestInPeaceContent();
      default: return const SizedBox.shrink();
    }
  }

  Widget _buildReflectionContent() {
    return Column(
      children: [
        Text(
          'Replay your day like a movie. Offer the high and low moments to God.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp, color: AppColors.textSecondary, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 20.h),
        RoutineActionButton(
          text: 'I Have Reflected',
          color: Colors.indigo,
          onTap: () => controller.nextStep(),
        ),
      ],
    );
  }

  Widget _buildGratitudeContent() {
    final textController = TextEditingController();
    return Column(
      children: [
        TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: 'I am grateful for...',
            filled: true,
            fillColor: AppColors.iconBgGrey,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
          ),
        ),
        SizedBox(height: 20.h),
        RoutineActionButton(
          text: 'Save gratitude',
          color: Colors.indigo,
          onTap: () => controller.saveGratitude(textController.text),
        ),
      ],
    );
  }

  Widget _buildReadScriptureContent() {
    return Column(
      children: [
        Text(
          'A gentle verse to calm your spirit before sleep.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 20.h),
        RoutineActionButton(
          text: '📖 Read Scripture',
          color: Colors.indigo,
          onTap: () {
            Get.toNamed(Routes.PRAYER_CONTENT, arguments: {
              'title': 'Nightly Shalom',
              'description': 'Rest your heart in these words.',
              'content': 'In peace I will lie down and sleep, for you alone, LORD, make me dwell in safety.',
              'verse': '“In peace I will lie down and sleep...”',
              'reference': 'Psalm 4:8'
            })?.then((_) => controller.completeStep3());
          },
        ),
      ],
    );
  }

  Widget _buildRestInPeaceContent() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(color: Colors.indigo.withOpacity(0.05), borderRadius: BorderRadius.circular(20.r)),
          child: Obx(() => controller.isStepLoading.value
              ? const CircularProgressIndicator()
              : Text(
                  controller.currentPrayer.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, height: 1.5, fontStyle: FontStyle.italic, color: AppColors.textPrimary),
                )),
        ),
        SizedBox(height: 20.h),
        RoutineActionButton(
          text: '💤 Goodnight',
          color: Colors.indigo,
          onTap: () {
            controller.flutterTts.stop();
            controller.nextStep();
          },
        ),
      ],
    );
  }
}
