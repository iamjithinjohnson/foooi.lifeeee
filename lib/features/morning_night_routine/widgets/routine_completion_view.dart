import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/app_colors.dart';
import 'package:foi/utils/app_constants.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import 'routine_stat_card.dart';

class RoutineCompletionView extends StatelessWidget {
  final String title;
  final String description;
  final IconData topIcon;
  final Color themeColor;
  final int earnedXp;
  final String streakValue;
  final VoidCallback onDone;
  final String buttonText;

  const RoutineCompletionView({
    super.key,
    required this.title,
    required this.description,
    required this.topIcon,
    this.themeColor = AppColors.primary,
    required this.earnedXp,
    required this.streakValue,
    required this.onDone,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: AppConstants.screenWPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeOutBack,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        width: 160.w,
                        height: 160.w,
                        decoration: BoxDecoration(
                          color: themeColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          topIcon,
                          color: themeColor,
                          size: 64.w,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              RoutineStatCard(
                label: 'Routine Streak',
                value: streakValue,
                icon: Icons.local_fire_department_rounded,
                color: Colors.orange,
              ),
              SizedBox(height: 16.h),
              RoutineStatCard(
                label: 'Faith Points',
                value: '+$earnedXp XP 🌿',
                icon: Icons.auto_awesome_rounded,
                color: Colors.blue,
                isAnimated: true,
                totalValue: earnedXp,
              ),
              const Spacer(),
              WwPrimaryButton(
                text: buttonText,
                onPressed: onDone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
