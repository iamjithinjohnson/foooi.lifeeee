import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import 'package:foi/utils/app_colors.dart';
import 'package:foi/features/morning_night_routine/controller/morning_routine_controller.dart';
import 'package:foi/utils/routes/app_routes.dart';
import '../widgets/routine_header.dart';
import '../widgets/routine_step_card.dart';
import '../widgets/routine_action_button.dart';
import '../widgets/routine_completion_view.dart';
import '../widgets/breathing_circle.dart';

class MorningRoutineScreen extends GetView<MorningRoutineController> {
  const MorningRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCompleted.value) {
        return RoutineCompletionView(
          title: 'Well done',
          description: 'Take a moment to carry this peace into your day.',
          topIcon: Icons.spa_rounded,
          earnedXp: controller.earnedSessionXp.value,
          streakValue: '5 Days',
          buttonText: 'Ready for the day',
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
                    themeColor: AppColors.primary,
                  ),
                  if (!controller.isStarted.value) _buildIntroSection(context),
                  Expanded(child: _buildStepsList(context)),
                  if (!controller.isStarted.value) 
                    Padding(
                      padding: EdgeInsets.all(24.w),
                      child: RoutineActionButton(
                        text: '✨ Start Morning Routine',
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
      top: 0,
      left: 0,
      right: 0,
      height: 350.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsImage.morning_bg),
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
                Colors.white.withOpacity(0.4),
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
            'Morning Routine',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 34.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Start your day with peace and purpose.',
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
                themeColor: AppColors.primary,
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
      case 0:
        return _buildBreathingContent();
      case 1:
        return _buildThankGodContent();
      case 2:
        return _buildReadScriptureContent();
      case 3:
        return _buildIntentionContent();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildBreathingContent() {
    return Column(
      children: [
        BreathingCircle(
          onCycleComplete: () {
            controller.breathingCycle.value++;
            if (controller.breathingCycle.value >= 3) {
              Future.delayed(const Duration(milliseconds: 500), () => controller.nextStep());
            }
          },
          onStateChange: (text) => controller.breathingText.value = text,
          themeColor: AppColors.primary,
        ),
        SizedBox(height: 20.h),
        Obx(() => Text(
          controller.breathingText.value,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
        )),
        SizedBox(height: 8.h),
        Obx(() => Text(
          'Cycle ${controller.breathingCycle.value}/3',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        )),
      ],
    );
  }

  Widget _buildThankGodContent() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.iconBgBlue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20.r),
          ),
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
          text: '🙏 Done',
          onTap: () {
            controller.flutterTts.stop();
            controller.nextStep();
          },
        ),
      ],
    );
  }

  Widget _buildReadScriptureContent() {
    return Column(
      children: [
        Text(
          'A special verse curated for your morning meditation.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 20.h),
        RoutineActionButton(
          text: '📖 Read Meditation',
          onTap: () {
            Get.toNamed(Routes.PRAYER_CONTENT, arguments: {
              'title': 'Morning Meditation',
              'description': 'Rise and shine in His presence.',
              'content': 'The steadfast love of the LORD never ceases; his mercies never come to an end; they are new every morning; great is your faithfulness.',
              'verse': '“The steadfast love of the LORD never ceases...”',
              'reference': 'Lamentations 3:22-23'
            })?.then((_) => controller.completeStep3());
          },
        ),
      ],
    );
  }

  Widget _buildIntentionContent() {
    final textController = TextEditingController();
    return Column(
      children: [
        TextField(
          controller: textController,
          maxLines: 2,
          decoration: InputDecoration(
            hintText: 'What is your intention today?',
            filled: true,
            fillColor: AppColors.iconBgGrey,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
          ),
        ),
        SizedBox(height: 20.h),
        RoutineActionButton(
          text: 'Save & Finish',
          onTap: () => controller.saveIntention(textController.text),
        ),
      ],
    );
  }
}
