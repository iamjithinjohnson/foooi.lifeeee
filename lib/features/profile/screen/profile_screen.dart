import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:foi/utils/assets/image_assets.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 16.h),
            _buildViewProfileButton(),
            SizedBox(height: 24.h),
            _buildQuickActions(),
            SizedBox(height: 24.h),
            _buildProBanner(),
            SizedBox(height: 32.h),
            _buildSettingsSection(context),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 380.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImage.bg_1),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.0), Colors.white],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Playfair Display',
                color: const Color(0xFF0F172A),
              ),
            ),
            SizedBox(height: 20.h),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 130.w,
                  height: 130.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4.w),
                    image: const DecorationImage(
                      image: AssetImage(
                        AssetsImage.bg_2,
                      ), // Using bg2 as placeholder for user photo
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.name.value,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.stars, color: Colors.blue, size: 20.w),
                ],
              ),
            ),
            SizedBox(height: 4.h),
            Obx(
              () => Text(
                controller.church.value,
                style: TextStyle(fontSize: 14.sp, color: const Color(0xFF64748B)),
              ),
            ),
            SizedBox(height: 4.h),
            Obx(
              () => Text(
                controller.bio.value,
                style: TextStyle(fontSize: 12.sp, color: const Color(0xFF94A3B8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewProfileButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: OutlinedButton(
        onPressed: () => Get.toNamed(Routes.EDIT_PROFILE),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF1E293B)),
          minimumSize: Size(160.w, 44.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Text(
          'View or Edit Profile',
          style: TextStyle(
            color: const Color(0xFF1E293B),
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildQuickActionItem(
            'My Church',
            '🙏',
            onTap: () => Get.toNamed(Routes.MY_CHURCH),
          ),
          _buildQuickActionItem(
            'CITO Community',
            '🤝',
            onTap: () => Get.toNamed(Routes.CITO_COMMUNITY),
          ),
          _buildQuickActionItem(
            'Jobs',
            '💼',
            onTap: () => Get.toNamed(Routes.JOBS),
          ),
          _buildQuickActionItem(
            'Matrimony',
            '❤️',
            onTap: () => Get.toNamed(Routes.MATRIMONY),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionItem(
    String label,
    String icon, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 75.w,
            height: 75.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(icon, style: const TextStyle(fontSize: 32)),
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: 80.w,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xFF1E293B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Image.asset(AssetsImage.proUser),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ACCOUNT SETTINGS',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF94A3B8),
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              children: [
                _buildSwitchItem(
                  'Business Listing',
                  'Show in Business Network',
                  controller.businessListing,
                  controller.toggleBusinessListing,
                ),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                _buildSwitchItem(
                  'Matrimony Profile',
                  'Visible to CITO members',
                  controller.matrimonyProfile,
                  controller.toggleMatrimonyProfile,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              children: [
                _buildMenuItem(Icons.bookmark_border, 'Saved Items'),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                _buildMenuItem(
                  Icons.settings_outlined,
                  'Settings',
                  onTap: () => Get.toNamed(Routes.SETTINGS),
                ),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                _buildMenuItem(Icons.headset_mic_outlined, 'Support'),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                _buildMenuItem(Icons.info_outline, 'About Us'),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                _buildMenuItem(
                  Icons.logout,
                  'Logout',
                  color: const Color(0xFFEF4444),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchItem(
    String title,
    String subtitle,
    RxBool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => CupertinoSwitch(
              value: value.value,
              activeColor: Colors.orange,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title, {
    Color? color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Icon(icon, color: color ?? const Color(0xFF1E293B), size: 22.w),
            SizedBox(width: 16.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: color ?? const Color(0xFF1E293B),
              ),
            ),
            const Spacer(),
            if (color == null)
              Icon(
                Icons.chevron_right,
                color: const Color(0xFF94A3B8),
                size: 20.w,
              ),
          ],
        ),
      ),
    );
  }
}
