// import 'package:get/get.dart';
// import 'package:lejit_app/infrastructure/utils/utility.dart';
// import 'package:lejit_app/presentation/05_law_students/student_course/models/student_enrollments_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/services/lawyer_course_service.dart';

// class StudentEnrollmentController extends GetxController {
//   final LawyerCourseService _service;

//   StudentEnrollmentController(this._service);

//   var isLoading = false.obs;
//   var enrollments = <StudentEnrollment>[].obs;
//   var totalEnrollments = 0.obs;
//   var currentPage = 1.obs;
//   var hasMore = false.obs;

//   var searchQuery = ''.obs;
//   var selectedStatus = 'all'.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchEnrollments();
//   }

//   Future<void> fetchEnrollments({bool refresh = false}) async {
//     if (refresh) currentPage.value = 1;

//     isLoading.value = true;
//     try {
//       final result = await _service.getStudentMyCourses(
//         page: currentPage.value,
//         limit: 10,
//         status: selectedStatus.value,
//         search: searchQuery.value,
//       );

//       result.fold((l) => Utility.showErrorMessage(message: l.message), (r) {
//         final response = StudentEnrollmentsResponse.fromJson(r);
//         if (refresh) {
//           enrollments.assignAll(response.data.enrollments);
//         } else {
//           enrollments.addAll(response.data.enrollments);
//         }
//         totalEnrollments.value = response.data.total;
//         hasMore.value = response.data.hasMore;
//       });
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void onSearch(String query) {
//     searchQuery.value = query;
//     fetchEnrollments(refresh: true);
//   }

//   void onStatusChanged(String status) {
//     selectedStatus.value = status;
//     fetchEnrollments(refresh: true);
//   }

//   void loadMore() {
//     if (hasMore.value && !isLoading.value) {
//       currentPage.value++;
//       fetchEnrollments();
//     }
//   }
// }
