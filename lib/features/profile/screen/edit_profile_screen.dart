import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/features/profile/controller/profile_controller.dart';
import 'package:foi/widgets/ww_primary_button.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field_email.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field_phone.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileController controller = Get.find<ProfileController>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController bioController;
  late TextEditingController churchController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: controller.name.value);
    emailController = TextEditingController(text: controller.email.value);
    phoneController = TextEditingController(text: controller.phone.value);
    bioController = TextEditingController(text: controller.bio.value);
    churchController = TextEditingController(text: controller.church.value);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    bioController.dispose();
    churchController.dispose();
    super.dispose();
  }

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
          'Edit Profile',
          style: TextStyle(
            color: const Color(0xFF0F172A),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            _buildProfileImage(),
            SizedBox(height: 32.h),
            WwTextField(
              controller: nameController,
              title: 'Full Name',
              hintText: 'Enter your full name',
            ),
            SizedBox(height: 16.h),
            WwTextFieldEmail(
              controller: emailController,
              title: 'Email Address',
              hintText: 'example@email.com',
            ),
            SizedBox(height: 16.h),
            WwTextFieldPhone(
              controller: phoneController,
              title: 'Phone Number',
              hintText: 'Enter phone number',
              onChanged: (phone) {
                // handle phone change
              },
            ),
            SizedBox(height: 16.h),
            WwTextField(
              controller: churchController,
              title: 'Church',
              hintText: 'Current church name',
            ),
             SizedBox(height: 16.h),
            WwTextField(
              controller: bioController,
              title: 'Bio',
              hintText: 'Tell members about yourself...',
            ),
            SizedBox(height: 48.h),
             WwPrimaryButton(
               onPressed: () {
                 controller.updateProfile(
                    newName: nameController.text,
                    newEmail: emailController.text,
                    newPhone: phoneController.text,
                    newBio: bioController.text,
                    newChurch: churchController.text,
                 );
               },
               text: 'Save Changes',
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage('https://i.pravatar.cc/300'), // placeholder
              fit: BoxFit.cover,
            ),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 4.w),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: Color(0xFF13768E),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.camera_alt, color: Colors.white, size: 18.w),
          ),
        ),
      ],
    );
  }
}
