import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foi/utils/app_colors.dart';
import 'package:foi/utils/routes/app_routes.dart';
import '../controller/plan_detail_controller.dart';
import '../model/plan_session.dart';

class PlanDetailScreen extends GetView<PlanDetailController> {
  const PlanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments?['title'] ?? '7-Day Peace Plan';
    final String subtitle =
        Get.arguments?['subtitle'] ??
        'Find inner peace through daily scripture on God\'s calming presence.';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildTitleSection(title, subtitle),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  itemCount: controller.sessions.length,
                  itemBuilder: (context, index) {
                    final session = controller.sessions[index];
                    return _buildJourneyItem(context, session, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 16.h),
      child: IconButton(
        onPressed: () => Get.back(),
        icon: Container(
          padding: EdgeInsets.all(8.w),
          decoration: const BoxDecoration(
            color: Color(0xFFF1F5F9),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back,
            color: const Color(0xFF1E293B),
            size: 20.w,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F172A),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF64748B),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyItem(
    BuildContext context,
    PlanSession session,
    int index,
  ) {
    final bool isLast = index == controller.sessions.length - 1;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressLine(session.status, isLast),
          SizedBox(width: 16.w),
          Expanded(child: _buildSessionCard(context, session, index)),
        ],
      ),
    );
  }

  Widget _buildProgressLine(SessionStatus status, bool isLast) {
    Color color;
    switch (status) {
      case SessionStatus.completed:
        color = AppColors.success;
        break;
      case SessionStatus.active:
        color = AppColors.primary;
        break;
      case SessionStatus.locked:
        color = const Color(0xFFE2E8F0);
        break;
    }

    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            color: status == SessionStatus.locked ? Colors.white : color,
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2.w),
          ),
          child: Center(
            child: status == SessionStatus.completed
                ? Icon(Icons.check, color: Colors.white, size: 16.w)
                : status == SessionStatus.active
                ? Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  )
                : Icon(Icons.lock, color: color, size: 14.w),
          ),
        ),
        if (!isLast)
          Expanded(
            child: Container(width: 2.w, color: color.withOpacity(0.3)),
          ),
      ],
    );
  }

  Widget _buildSessionCard(
    BuildContext context,
    PlanSession session,
    int index,
  ) {
    final bool isActive = session.status == SessionStatus.active;
    final bool isCompleted = session.status == SessionStatus.completed;
    final bool isLocked = session.status == SessionStatus.locked;

    return GestureDetector(
      onTap: isLocked
          ? null
          : () async {
              final result = await Get.toNamed(
                Routes.READING_SESSION,
                arguments: {'session': session},
              );
              if (result == true) {
                controller.completeSession(index);
                _showSuccessMessage(session.title);
              }
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(bottom: 24.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white
              : (isLocked ? const Color(0xFFF8FAFC) : Colors.white),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isActive
                ? AppColors.primary
                : (isLocked
                      ? const Color(0xFFE2E8F0)
                      : AppColors.success.withOpacity(0.2)),
            width: isActive ? 2.w : 1.w,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: isLocked
                    ? const Color(0xFFF1F5F9)
                    : (isActive
                          ? AppColors.primary.withOpacity(0.1)
                          : AppColors.success.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                session.icon,
                color: isLocked
                    ? const Color(0xFF94A3B8)
                    : (isActive ? AppColors.primary : AppColors.success),
                size: 28.w,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        session.dayName,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: isActive
                              ? AppColors.primary
                              : (isLocked
                                    ? const Color(0xFF94A3B8)
                                    : AppColors.success),
                        ),
                      ),
                      if (isActive) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            'TODAY 🌿',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    session.title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isLocked
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF1E293B),
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            if (!isLocked)
              Icon(
                Icons.chevron_right,
                color: isActive ? AppColors.primary : const Color(0xFFCBD5E1),
                size: 20.w,
              )
            else
              Text('🔒', style: TextStyle(fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }

  void _showSuccessMessage(String title) {
    Get.snackbar(
      '🌟 Well done!',
      'You completed "$title" and earned +5 XP!',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
      colorText: AppColors.textPrimary,
      icon: const Icon(Icons.auto_awesome, color: Colors.amber),
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.all(16.w),
      borderRadius: 12.r,
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
