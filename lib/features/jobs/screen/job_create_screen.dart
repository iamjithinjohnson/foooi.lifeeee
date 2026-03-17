import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field_area.dart';
import 'package:get/get.dart';

class JobCreateScreen extends StatefulWidget {
  const JobCreateScreen({super.key});

  @override
  State<JobCreateScreen> createState() => _JobCreateScreenState();
}

class _JobCreateScreenState extends State<JobCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedJobType = 'Full Time';
  final List<String> _jobTypes = ['Full Time', 'Part Time', 'Contract', 'Volunteer'];

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
          'Post a Job',
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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Opportunity',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 8.h),
              Text(
                'Fill in the details to post a new job opening for the community.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF64748B),
                ),
              ),
              SizedBox(height: 32.h),
              const WwTextField(
                title: 'Job Title',
                hintText: 'e.g. Youth Ministry Coordinator',
                required: true,
                enableBorder: true,
              ),
              SizedBox(height: 20.h),
              const WwTextField(
                title: 'Company / Church Name',
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
              SizedBox(height: 20.h),
              const WwTextField(
                title: 'Compensation',
                hintText: r'e.g. $35,000 - $45,000',
                enableBorder: true,
              ),
              SizedBox(height: 24.h),
              Text(
                'Job Type',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF64748B),
                ),
              ),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: _jobTypes.map((type) {
                  final isSelected = _selectedJobType == type;
                  return ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedJobType = type);
                      }
                    },
                    selectedColor: const Color(0xFFFF5C00),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF1E293B),
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
                    showCheckmark: false,
                  );
                }).toList(),
              ),
              SizedBox(height: 24.h),
              const WwTextFieldTextArea(
                title: 'Job Description',
                hintText: 'Describe the roles, responsibilities and requirements...',
                required: true,
                enableBorder: true,
                maximumLines: 8,
              ),
              SizedBox(height: 40.h),
              WwPrimaryButton(
                text: 'Post Opportunity',
                color: const Color(0xFFFF5C00),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back();
                    Get.snackbar(
                      'Success',
                      'Job posted successfully!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
