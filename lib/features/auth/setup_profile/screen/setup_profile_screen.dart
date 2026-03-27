import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/assets/image_assets.dart';
import '../../../../widgets/ww_auth_background.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import '../../../../widgets/ww_textfield/ww_text_field.dart';
import '../controller/setup_profile_controller.dart';

class SetupProfileScreen extends GetView<SetupProfileController> {
  const SetupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WwAuthBackground(),

          SafeArea(
            child: Column(
              children: [
                // Top Navigation and Progress
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: controller.previousStep,
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            height: 6.h,
                            width: 200.w,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8ECEF),
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Obx(
                              () => FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: controller.progress,
                                child: Container(
                                  color: const Color(
                                    0xFFFF4D00,
                                  ), // Orange progress
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // Balancing IconButton space
                    ],
                  ),
                ),

                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildProfileInfoStep(context),
                      _buildGuidanceStep(context),
                      _buildDenominationStep(context),
                      _buildGoalsStep(context),
                      _buildPermissionStep(context),
                      _buildFinalStep(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContainer({
    required BuildContext context,
    required String title,
    required Widget content,
    required String buttonText,
    required VoidCallback onButtonPressed,
    bool showButton = true,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          // const Spacer(flex: 2),
          Expanded(child: content),
          // const Spacer(flex: 3),
          if (showButton)
            WwPrimaryButton(onPressed: onButtonPressed, text: buttonText),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildProfileInfoStep(BuildContext context) {
    return _buildStepContainer(
      context: context,
      title: 'Setup Profile',
      content: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            _buildFieldLabel('What’s your full name?'),
            WwTextField(
              controller: controller.nameController,
              hintText: 'Enter your full Name',
              textAlign: TextAlign.start,
              enableBorder: true,
            ),
            SizedBox(height: 20.h),
            _buildFieldLabel('What is your Date of Birth?'),
            Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    hint: 'Day',
                    value: controller.selectedDay,
                    items: List.generate(31, (i) => (i + 1).toString()),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: _buildDropdown(
                    hint: 'Month',
                    value: controller.selectedMonth,
                    items: [
                      'Jan',
                      'Feb',
                      'Mar',
                      'Apr',
                      'May',
                      'Jun',
                      'Jul',
                      'Aug',
                      'Sep',
                      'Oct',
                      'Nov',
                      'Dec',
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: _buildDropdown(
                    hint: 'Year',
                    value: controller.selectedYear,
                    items: List.generate(
                      100,
                      (i) => (DateTime.now().year - i).toString(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _buildFieldLabel('What is your Gender?'),
            _buildDropdown(
              hint: 'Select Gender',
              value: controller.selectedGender,
              items: ['Male', 'Female', 'Other'],
            ),
            SizedBox(height: 20.h),
            _buildFieldLabel('How are your stress levels?'),
            Row(
              children: ['Great', 'Moderate', 'Low'].map((level) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Obx(
                      () => GestureDetector(
                        onTap: () =>
                            controller.selectedStressLevel.value = level,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: controller.selectedStressLevel.value == level
                                ? const Color(0xFFF1F5F9)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color:
                                  controller.selectedStressLevel.value == level
                                  ? Colors.blue
                                  : const Color(0xFFE8ECEF),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            level,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildFieldLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required RxString value,
    required List<String> items,
  }) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFE8ECEF)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value.value.isEmpty ? null : value.value,
            hint: Text(hint, style: TextStyle(fontSize: 14.sp)),
            isExpanded: true,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: TextStyle(fontSize: 14.sp)),
              );
            }).toList(),
            onChanged: (v) => value.value = v ?? '',
          ),
        ),
      ),
    );
  }

  Widget _buildGuidanceStep(BuildContext context) {
    final options = [
      'Bible-Centered', // (Neutral – Recommended)
      'Traditional / Liturgical',
      'Spirit-Led / Charismatic',
      'Reformed / Theology-Focused',
      'I’d like to choose a specific denomination',
    ];
    return _buildStepContainer(
      context: context,
      title: 'How would you like foi to guide you?',
      content: SingleChildScrollView(
        child: Column(
          children: options.map((opt) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Obx(
                () => GestureDetector(
                  onTap: () => controller.selectedGuidance.value = opt,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: controller.selectedGuidance.value == opt
                          ? const Color(0xFFF1F5F9)
                          : const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: controller.selectedGuidance.value == opt
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      opt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildDenominationStep(BuildContext context) {
    return _buildStepContainer(
      context: context,
      title: 'What is your denomination?',
      content: SingleChildScrollView(
        child: Column(
          children: [
            _buildDenomSelectionTile('Catholic'), //  - Roman Catholic Church
            _buildDenomSelectionTile('Orthodox'), //  - Eastern Orthodox Church
            _buildProtestantTile(),
          ],
        ),
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildDenomSelectionTile(String denom) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Obx(
        () => GestureDetector(
          onTap: () {
            controller.selectedDenomination.value = denom;
            controller.isProtestantExpanded.value = false;
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: controller.selectedDenomination.value == denom
                  ? const Color(0xFFF1F5F9)
                  : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: controller.selectedDenomination.value == denom
                    ? Colors.blue
                    : Colors.transparent,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              denom,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProtestantTile() {
    final protestantSubOptions = [
      'Evangelical / Non-Denominational',
      'Pentecostal / Charismatic',
      'Reformed / Calvinist',
    ];
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Obx(() {
        final isSubOptionSelected = protestantSubOptions.contains(
          controller.selectedDenomination.value,
        );
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.isProtestantExpanded.toggle();
                // If we expand, we don't necessarily select it yet,
                // but we want to clear other top-level selections if a sub-option was previously selected
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: isSubOptionSelected
                      ? const Color(0xFFF1F5F9)
                      : const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: isSubOptionSelected
                        ? Colors.blue
                        : Colors.transparent,
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Protestant',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      controller.isProtestantExpanded.value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 20.w,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
            if (controller.isProtestantExpanded.value)
              Container(
                margin: EdgeInsets.only(top: 8.h),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFFE8ECEF)),
                ),
                child: Column(
                  children: protestantSubOptions.map((sub) {
                    return ListTile(
                      title: Text(sub, style: TextStyle(fontSize: 13.sp)),
                      selected: controller.selectedDenomination.value == sub,
                      selectedTileColor: const Color(0xFFF1F5F9),
                      onTap: () {
                        controller.selectedDenomination.value = sub;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildGoalsStep(BuildContext context) {
    final goals = [
      'Stay Inspired',
      'Build Confidence',
      'Overcome Anxiety',
      'Better Relationships',
      'Wise Decisions',
      'Bible Understanding',
      'Deeper Prayer',
      'Solve Problems',
    ];
    return _buildStepContainer(
      context: context,
      title: 'What are your current goals?',
      content: Column(
        children: [
          SizedBox(height: 20.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 1.5,
            physics: const NeverScrollableScrollPhysics(),
            children: goals
                .map(
                  (goal) => Obx(
                    () => GestureDetector(
                      onTap: () => controller.toggleGoal(goal),
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.selectedGoals.contains(goal)
                              ? const Color(0xFFF1F5F9)
                              : const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: controller.selectedGoals.contains(goal)
                                ? Colors.blue
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8.w),
                        child: Text(
                          goal,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: controller.selectedGoals.contains(goal)
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildPermissionStep(BuildContext context) {
    return _buildStepContainer(
      context: context,
      title: 'Allow access to your\npermissions',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPermissionTile(
            icon: Icons.location_on,
            title: 'Location authorization',
            subtitle: 'Find Churches near you',
            description:
                'Your location will help us to find suitable churches near you. Your location will not be visible to anyone.',
            value: controller.locationPermission,
          ),
          SizedBox(height: 24.h),
          _buildPermissionTile(
            icon: Icons.location_on, // Image showed location icon again?
            title: 'Contact Access',
            subtitle: 'Find contacts near you',
            description:
                'Contact access will help us find your contacts with the suitable churches',
            value: controller.contactsPermission,
          ),
        ],
      ),
      buttonText: 'Allow',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildPermissionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required RxBool value,
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFEF2),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(icon, color: Colors.black, size: 24.w),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Obx(
                () => Switch(
                  value: value.value,
                  onChanged: (v) => value.value = v,
                  activeColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black45,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFinalStep(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsImage.holy_gif, width: 250.w),
        SizedBox(height: 40.h),
        Text(
          'Welcome to FOI',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 8.h),
        Text(
          'May you find the peace and guidance you seek',
          style: TextStyle(fontSize: 16.sp, color: const Color(0xFF3F2109)),
        ),
        SizedBox(height: 40.h),
        GestureDetector(
          onTap: controller.finishSetup,
          child: Container(
            width: 200.w,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFF2B5AE1),
              borderRadius: BorderRadius.circular(30.r),
            ),
            alignment: Alignment.center,
            child: Text(
              'Let’s Begin',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
