import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../controller/settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
              color: Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, color: Colors.black54, size: 20.sp),
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60.h,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(fontSize: 32.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              'Adjust settings based on your preference',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16.sp,
                color: const Color(0xFF64748B),
              ),
            ),
            SizedBox(height: 32.h),

            _buildSectionHeader(context, 'PROFILE MODE'),
            _buildProfileModeSelector(context),
            SizedBox(height: 32.h),

            _buildSectionHeader(context, 'BIBLE VERSION'),
            _buildBibleVersionSelector(context),
            SizedBox(height: 32.h),

            _buildSectionHeader(context, 'NOTIFICATIONS'),
            _buildNotificationSettings(context),
            SizedBox(height: 32.h),

            _buildSectionHeader(context, 'PRIVACY AND COMMUNITY'),
            _buildPrivacySettings(context),
            SizedBox(height: 32.h),

            _buildSectionHeader(context, 'LANGUAGE & VOICE'),
            _buildLanguageSettings(context),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

   Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF94A3B8),
              letterSpacing: 1.2,
            ),
      ),
    );
  }

   Widget _buildProfileModeSelector(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.profileModes.map((mode) {
          final isSelected =
              controller.selectedProfileMode.value == mode['title'];
          return GestureDetector(
            onTap: () => controller.setProfileMode(mode['title']!),
            child: Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFE0E7FF) : Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF2B5AE1)
                      : const Color(0xFFE2E8F0),
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Column(
                children: [
                   Text(
                    mode['title']!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? const Color(0xFF1E1B4B)
                              : const Color(0xFF1E293B),
                        ),
                  ),
                   Text(
                    mode['age']!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12.sp,
                          color: isSelected
                              ? const Color(0xFF4338CA)
                              : const Color(0xFF94A3B8),
                        ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

   Widget _buildBibleVersionSelector(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Obx(
        () => Column(
          children: controller.bibleVersions.asMap().entries.map((entry) {
            final index = entry.key;
            final version = entry.value;
            final isSelected = controller.selectedBibleVersion.value == version;
            final isLast = index == controller.bibleVersions.length - 1;

            return InkWell(
              onTap: () => controller.setBibleVersion(version),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: index == 0 ? Radius.circular(16.r) : Radius.zero,
                    bottom: isLast ? Radius.circular(16.r) : Radius.zero,
                  ),
                  border: isSelected
                      ? Border.all(color: const Color(0xFF2B5AE1), width: 1.5)
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      version,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? const Color(0xFF1E1B4B) : const Color(0xFF1E293B),
                          ),
                    ),
                    if (isSelected)
                      Icon(
                        Icons.check_circle,
                        color: const Color(0xFF2B5AE1),
                        size: 24.sp,
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildNotificationSettings(BuildContext context) {
    return _buildSettingsCard([
      _buildSwitchTile(
        context,
        'Prayer Reminders',
        controller.prayerReminders,
        controller.togglePrayerReminders,
      ),
      _buildSwitchTile(
        context,
        'Prayer Requests',
        controller.prayerRequests,
        controller.togglePrayerRequests,
      ),
      _buildSwitchTile(
        context,
        'Daily Scripture',
        controller.dailyScripture,
        controller.toggleDailyScripture,
      ),
      _buildSwitchTile(context, 'Events', controller.events, controller.toggleEvents),
    ]);
  }

  Widget _buildPrivacySettings(BuildContext context) {
    return _buildSettingsCard([
      _buildSwitchTile(
        context,
        'Prayer Circles',
        controller.prayerCircles,
        controller.togglePrayerCircles,
      ),
      _buildSwitchTile(
        context,
        'Share Prayer Link',
        controller.sharePrayerLink,
        controller.toggleSharePrayerLink,
      ),
      _buildSwitchTile(
        context,
        'Leader Mode',
        controller.leaderMode,
        controller.toggleLeaderMode,
      ),
    ]);
  }

   Widget _buildLanguageSettings(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Text(
              controller.selectedLanguage.value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Change Language',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2B5AE1),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: children.asMap().entries.map((entry) {
          final index = entry.key;
          final widget = entry.value;
          final isLast = index == children.length - 1;

          return Column(
            children: [
              widget,
              if (!isLast) const Divider(height: 1, color: Color(0xFFF1F5F9)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    String title,
    RxBool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1E293B),
                ),
          ),
          Obx(
            () => CupertinoSwitch(
              value: value.value,
              onChanged: onChanged,
              activeColor: const Color(0xFF2B5AE1),
            ),
          ),
        ],
      ),
    );
  }
}
