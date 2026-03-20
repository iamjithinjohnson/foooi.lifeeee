import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/utils/routes/app_routes.dart';
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
                      _buildNameStep(context),
                      _buildAgeStep(context),
                      _buildGenderStep(context),
                      _buildDenominationStep(context),
                      _buildBibleVersionStep(context),
                      _buildStressLevelStep(context),
                      _buildGoalsStep(context),
                      _buildPermissionStep(context),
                      _buildChurchStep(context),
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

  Widget _buildNameStep(BuildContext context) {
    return _buildStepContainer(
      context: context,
      title: 'What’s your full name?',
      content: Column(
        mainAxisAlignment: .center,
        children: [
          WwTextField(
            controller: controller.nameController,
            hintText: 'Enter your full Name',
            textAlign: TextAlign.center,
            enableBorder: false,
            // textStyle: TextStyle(
            //   fontSize: 32.sp,
            //   fontFamily: 'PP Cirka',
            //   color: const Color(0xffB9AF9F),
            // ),
          ),
        ],
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildAgeStep(BuildContext context) {
    final ageGroups = [
      '14-18 years',
      '18-25 years',
      '25-35 years',
      '>35 years',
    ];
    return _buildStepContainer(
      context: context,
      title: 'What is your Age Group',
      content: Column(
        mainAxisAlignment: .center,
        children: ageGroups
            .map(
              (age) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Obx(
                  () => GestureDetector(
                    onTap: () => controller.selectedAgeGroup.value = age,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: controller.selectedAgeGroup.value == age
                            ? const Color(0xFFF1F5F9)
                            : const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        age,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildGenderStep(BuildContext context) {
    final genders = ['Male', 'Female'];
    return _buildStepContainer(
      context: context,
      title: 'God created us Uniquely...\nWhat is your Gender?',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: genders
            .map(
              (gender) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Obx(
                  () => GestureDetector(
                    onTap: () => controller.selectedGender.value = gender,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: controller.selectedGender.value == gender
                            ? const Color(0xFFF1F5F9)
                            : const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        gender,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildDenominationStep(BuildContext context) {
    final denominations = [
      'Catholic',
      'Eastern Orthodox',
      'Oriental Orthodox',
      'Assyrian / Church of the East tradition',
      'Protestant',
      'Lutheran',
      'Reformed / Calvinist',
      'Anglican / Episcopalian',
      'Methodist / Wesleyan',
    ];
    return _buildStepContainer(
      context: context,
      title: 'What is your denomination?',
      content: SingleChildScrollView(
        child: Column(
          children: denominations
              .map(
                (denom) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Obx(
                    () => GestureDetector(
                      onTap: () =>
                          controller.selectedDenomination.value = denom,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        decoration: BoxDecoration(
                          color: controller.selectedDenomination.value == denom
                              ? const Color(0xFFF1F5F9)
                              : const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          denom,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildBibleVersionStep(BuildContext context) {
    final versions = ['NIV', 'ESV', 'NASB', 'NLT'];
    return _buildStepContainer(
      context: context,
      title: 'What is your Bible Preferred\nVersion?',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: versions
            .map(
              (ver) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Obx(
                  () => GestureDetector(
                    onTap: () => controller.selectedBibleVersion.value = ver,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: controller.selectedBibleVersion.value == ver
                            ? const Color(0xFFF1F5F9)
                            : const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        ver,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildStressLevelStep(BuildContext context) {
    final levels = ['Smooth Sailing', 'Everyday Stress', 'Navigating a crisis'];
    return _buildStepContainer(
      context: context,
      title: 'How are your stress levels\nthese days?',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: levels
            .map(
              (level) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Obx(
                  () => GestureDetector(
                    onTap: () => controller.selectedStressLevel.value = level,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: controller.selectedStressLevel.value == level
                            ? const Color(0xFFF1F5F9)
                            : const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        level,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      buttonText: 'Proceed',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildGoalsStep(BuildContext context) {
    final goals = [
      'Overcome Anxiety',
      'Better Relationships',
      'Find Peace',
      'Grow Faith',
      'Wise Decisions',
      'Deeper Prayer',
      'Bible Understanding',
      'Daily Devotion',
    ];
    return _buildStepContainer(
      context: context,
      title: 'What are your current goals\nto use Bible AI?',
      content: GridView.count(
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
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      goal,
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
            )
            .toList(),
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

  Widget _buildChurchStep(BuildContext context) {
    return _buildStepContainer(
      context: context,
      title: 'Choose which church\ncommunity you want to join',
      content: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              child: Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.add, color: Colors.orange, size: 30.w),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grace Church\nCommunity',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '12km far from you | Hispanic',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: const Text('Join'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      buttonText: 'Allow',
      onButtonPressed: controller.nextStep,
    );
  }

  Widget _buildFinalStep(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsImage.holy_gif, width: 250.w),
        SizedBox(height: 40.h),
        Text('Hold on..', style: Theme.of(context).textTheme.displayMedium),
        SizedBox(height: 8.h),
        Text(
          'Lord’s Light will shine upon you',
          style: TextStyle(fontSize: 16.sp, color: const Color(0xFF3F2109)),
        ),
        SizedBox(height: 40.h),
        GestureDetector(
          onTap: () => Get.offAllNamed(Routes.MAIN),
          child: Container(
            width: 200.w,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: const Color(0xFF2B5AE1),
              borderRadius: BorderRadius.circular(30.r),
            ),
            alignment: Alignment.center,
            child: Text(
              'Enter',
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
