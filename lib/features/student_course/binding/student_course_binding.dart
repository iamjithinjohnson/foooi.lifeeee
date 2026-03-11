// import 'package:get/get.dart';
// import 'package:lejit_app/presentation/05_law_students/student_course/controllers/student_course_controller.dart';
// import 'package:lejit_app/presentation/05_law_students/student_course/controllers/student_enrollment_controller.dart';
// import 'package:lejit_app/presentation/05_law_students/student_course/controllers/student_course_details_controller.dart';
// import 'package:lejit_app/presentation/05_law_students/student_course/controller/course_certificate_controller.dart';
// import 'package:lejit_app/presentation/lawyer_courses/services/lawyer_course_service.dart';
// import 'package:lejit_app/presentation/lawyer_courses/services/lawyer_course_service_impl.dart';

// class StudentCourseBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<LawyerCourseService>(() => LawyerCourseServiceImpl(Get.find()));
//     Get.lazyPut<StudentCourseController>(
//       () => StudentCourseController(Get.find()),
//     );
//     Get.lazyPut<StudentEnrollmentController>(
//       () => StudentEnrollmentController(Get.find()),
//     );
//     Get.lazyPut(() => StudentCourseDetailsController(Get.find()));
//     Get.lazyPut(() => CourseCertificateController(Get.find()));
//   }
// }
