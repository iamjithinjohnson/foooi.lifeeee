// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lejit_app/infrastructure/navigation/routes.dart';
// import 'package:lejit_app/infrastructure/theme/app_colors.dart';
// import 'package:lejit_app/presentation/05_law_students/student_course/controllers/student_enrollment_controller.dart';
// import 'package:lejit_app/presentation/05_law_students/student_course/models/student_enrollments_response.dart';
// import 'package:lejit_app/utils/styles.dart';
// import 'package:lejit_app/widgets/ww_app_bar.dart';
// import 'package:lejit_app/widgets/ww_empty_list.dart';
// import 'package:lejit_app/widgets/ww_textfield/ww_text_field.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import 'package:lejit_app/generated/locales.g.dart';

// class StudentEnrollmentScreen extends GetView<StudentEnrollmentController> {
//   const StudentEnrollmentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.scaffoldBg,
//       appBar: WwAppBar(title: LocaleKeys.my_enrollments.tr),
//       body: Column(
//         children: [
//           Expanded(
//             child: RefreshIndicator(
//               onRefresh: () => controller.fetchEnrollments(refresh: true),
//               child: SingleChildScrollView(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildHeader(),
//                     SizedBox(height: 20.h),
//                     _buildTabs(),
//                     SizedBox(height: 20.h),
//                     _buildSearchField(),
//                     SizedBox(height: 20.h),
//                     _buildEnrollmentList(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           LocaleKeys.track_your_progress.tr,
//           style: AppStyles.titleLarge.copyWith(fontSize: 24.sp),
//         ),
//         SizedBox(height: 4.h),
//         Text(
//           LocaleKeys.complete_courses_certificate.tr,
//           style: AppStyles.bodyMedium.copyWith(color: AppColors.grey2),
//         ),
//       ],
//     );
//   }

//   Widget _buildTabs() {
//     return Obx(
//       () => Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.r),
//           border: Border.all(color: AppColors.grey5),
//         ),
//         child: Row(
//           children: [
//             _buildTabItem(LocaleKeys.all.tr, 'all'),
//             _buildTabItem(LocaleKeys.active.tr, 'active'),
//             _buildTabItem(LocaleKeys.completed.tr, 'completed'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabItem(String title, String status) {
//     final isSelected = controller.selectedStatus.value == status;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => controller.onStatusChanged(status),
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 12.h),
//           decoration: BoxDecoration(
//             color: isSelected ? AppColors.primary : Colors.transparent,
//             borderRadius: BorderRadius.circular(12.r),
//           ),
//           child: Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14.sp,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               color: isSelected ? Colors.white : AppColors.grey2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchField() {
//     return WwTextField(
//       hintText: LocaleKeys.search_my_courses_hint.tr,
//       prefixIcon: const Icon(Icons.search, color: AppColors.grey2),
//       onChanged: controller.onSearch,
//       textInputAction: TextInputAction.search,
//       filled: true,
//     );
//   }

//   Widget _buildEnrollmentList() {
//     return Obx(() {
//       if (controller.isLoading.value && controller.enrollments.isEmpty) {
//         return _buildSkeletonList();
//       }

//       if (controller.enrollments.isEmpty) {
//         return Center(
//           child: Column(
//             children: [
//               SizedBox(height: 50.h),
//               WwEmptyErrorData(
//                 title: LocaleKeys.no_enrollments_found.tr,
//                 subtitle: LocaleKeys.not_enrolled_yet.tr,
//                 icon: Icons.assignment_late_outlined,
//               ),
//             ],
//           ),
//         );
//       }

//       return ListView.separated(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: controller.enrollments.length,
//         separatorBuilder: (context, index) => SizedBox(height: 15.h),
//         itemBuilder: (context, index) {
//           final enrollment = controller.enrollments[index];
//           return _buildEnrollmentCard(enrollment);
//         },
//       );
//     });
//   }

//   Widget _buildEnrollmentCard(StudentEnrollment enrollment) {
//     return InkWell(
//       onTap: () => Get.toNamed(
//         Routes.COURSE_LEARNING,
//         arguments: {'courseId': enrollment.course.id, 'isStudent': true},
//       ),
//       child: Container(
//         padding: EdgeInsets.all(12.w),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16.r),
//           border: Border.all(color: AppColors.grey5),
//         ),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12.r),
//               child: CachedNetworkImage(
//                 imageUrl: enrollment.course.thumbnailUrl ?? '',
//                 width: 80.w,
//                 height: 80.w,
//                 fit: BoxFit.cover,
//                 placeholder: (context, url) =>
//                     Container(color: AppColors.grey5),
//                 errorWidget: (context, url, e) => Container(
//                   color: AppColors.grey5,
//                   child: const Icon(Icons.image, color: AppColors.grey4),
//                 ),
//               ),
//             ),
//             SizedBox(width: 15.w),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     enrollment.course.category,
//                     style: AppStyles.bodySmall.copyWith(
//                       color: AppColors.primary,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 10.sp,
//                     ),
//                   ),
//                   SizedBox(height: 4.h),
//                   Text(
//                     enrollment.course.title,
//                     style: AppStyles.titleMedium.copyWith(
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 8.h),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10.r),
//                           child: LinearProgressIndicator(
//                             value: enrollment.completionPercent / 100,
//                             backgroundColor: AppColors.grey5,
//                             valueColor: const AlwaysStoppedAnimation(
//                               AppColors.primary,
//                             ),
//                             minHeight: 6.h,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10.w),
//                       Text(
//                         '${enrollment.completionPercent}%',
//                         style: AppStyles.bodySmall.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                     ],
//                   ),
//                   if (enrollment.completionPercent == 100) ...[
//                     SizedBox(height: 12.h),
//                     SizedBox(
//                       width: double.infinity,
//                       child: TextButton.icon(
//                         onPressed: () => Get.toNamed(
//                           Routes.COURSE_CERTIFICATE,
//                           arguments: enrollment,
//                         ),
//                         icon: Icon(
//                           Icons.workspace_premium_outlined,
//                           size: 16.sp,
//                           color: Colors.white,
//                         ),
//                         label: Text(
//                           LocaleKeys.download_certificate.tr,
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         style: TextButton.styleFrom(
//                           backgroundColor: AppColors.primary,
//                           padding: EdgeInsets.symmetric(vertical: 8.h),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.r),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSkeletonList() {
//     return Skeletonizer(
//       enabled: true,
//       child: ListView.separated(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: 3,
//         separatorBuilder: (context, index) => SizedBox(height: 15.h),
//         itemBuilder: (context, index) => Container(
//           height: 100.h,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16.r),
//           ),
//         ),
//       ),
//     );
//   }
// }
