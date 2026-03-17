import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/features/matrimony/controller/matrimony_controller.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field_area.dart';
import 'package:get/get.dart';

class MatrimonyCreateScreen extends GetView<MatrimonyController> {
  const MatrimonyCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Create Matrimony Profile',
          style: TextStyle(
            color: const Color(0xFF0F172A),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tell us about yourself',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 8.h),
              Text(
                'Help others get to know you within the community.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF64748B),
                ),
              ),
              SizedBox(height: 32.h),
              const WwTextField(
                title: 'Full Name',
                hintText: 'e.g. John Doe',
                required: true,
                enableBorder: true,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: const WwTextField(
                      title: 'Age',
                      hintText: 'e.g. 28',
                      required: true,
                      enableBorder: true,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFD0D5DD)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: Obx(() => DropdownButton<String>(
                              value: controller.selectedGender.value,
                              isExpanded: true,
                              items: ['Male', 'Female', 'Other'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value, style: TextStyle(fontSize: 14.sp)),
                                );
                              }).toList(),
                              onChanged: controller.updateGender,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const WwTextField(
                title: 'Occupation',
                hintText: 'e.g. Software Engineer',
                required: true,
                enableBorder: true,
              ),
              SizedBox(height: 20.h),
              const WwTextField(
                title: 'Church',
                hintText: 'e.g. Grace Community Church',
                required: true,
                enableBorder: true,
              ),
              SizedBox(height: 20.h),
              const WwTextField(
                title: 'Location',
                hintText: 'e.g. Houston, TX',
                required: true,
                enableBorder: true,
              ),
              SizedBox(height: 24.h),
              Text(
                'Interests',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF64748B),
                ),
              ),
              SizedBox(height: 12.h),
              Obx(() => Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: controller.interestsList.map((interest) {
                  final isSelected = controller.selectedInterests.contains(interest);
                  return FilterChip(
                    label: Text(interest),
                    selected: isSelected,
                    onSelected: (selected) => controller.toggleInterest(interest),
                    selectedColor: const Color(0xFFFF5C00).withOpacity(0.2),
                    checkmarkColor: const Color(0xFFFF5C00),
                    labelStyle: TextStyle(
                      color: isSelected ? const Color(0xFFFF5C00) : const Color(0xFF1E293B),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: BorderSide(
                        color: isSelected ? const Color(0xFFFF5C00) : const Color(0xFFE2E8F0),
                      ),
                    ),
                  );
                }).toList(),
              )),
              SizedBox(height: 24.h),
              const WwTextFieldTextArea(
                title: 'About Me',
                hintText: 'Share a bit about your faith and what you are looking for...',
                required: true,
                enableBorder: true,
                maximumLines: 8,
              ),
              SizedBox(height: 40.h),
              WwPrimaryButton(
                text: 'Create Profile',
                color: const Color(0xFFFF5C00),
                onPressed: controller.createProfile,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
