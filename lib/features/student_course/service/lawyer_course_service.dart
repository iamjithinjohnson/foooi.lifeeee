// import 'package:dio/dio.dart';
// import 'package:dartz/dartz.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_analytics_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_reviews_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_earnings_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_students_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_earnings_summary_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_transactions_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/my_courses_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/create_course_request.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_detail_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/enrollment_status_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_purchase_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/quiz_submission_response.dart';
// import 'package:lejit_app/services/api_service/dio_services.dart';

// abstract class LawyerCourseService {
//   Future<Either<CustomDioException, CourseDetailResponse>> createCourse(
//     CreateCourseRequest request,
//   );

//   Future<Either<CustomDioException, dynamic>> publishCourse(String id);

//   Future<Either<CustomDioException, CourseDetailResponse>> updateCourse(
//     String id,
//     CreateCourseRequest request,
//   );

//   Future<Either<CustomDioException, dynamic>> archiveCourse(String id);
//   Future<Either<CustomDioException, dynamic>> unarchiveCourse(String id);
//   Future<Either<CustomDioException, dynamic>> deleteCoursePermanently(
//     String id,
//   );
//   Future<Either<CustomDioException, MyCoursesResponse>> getMyCourses({
//     int page = 1,
//     int limit = 10,
//     String? status,
//     String? search,
//   });

//   Future<Either<CustomDioException, CourseDetailResponse>> getCourseDetail(
//     String id,
//   );

//   Future<Either<CustomDioException, CourseAnalyticsResponse>>
//   getCourseAnalytics(String id);

//   Future<Either<CustomDioException, CourseReviewsResponse>> getCourseReviews({
//     required String courseId,
//     int page = 1,
//     int limit = 10,
//     String sort = 'newest',
//     int? rating,
//     String? search,
//   });

//   Future<Either<CustomDioException, CourseEarningsResponse>> getCourseEarnings(
//     String courseId, {
//     int page = 1,
//     int limit = 10,
//     String? search,
//     String? status,
//     String? sort,
//   });

//   Future<Either<CustomDioException, CourseStudentsResponse>> getCourseStudents(
//     String courseId, {
//     int page = 1,
//     int limit = 10,
//     String? search,
//     String? status,
//     String? sort,
//   });

//   Future<Either<CustomDioException, CourseEarningsSummaryResponse>>
//   getCourseEarningsSummary();

//   Future<Either<CustomDioException, CourseTransactionsResponse>>
//   getCourseEarningsTransactions({
//     int page = 1,
//     int limit = 10,
//     String? search,
//     String? startDate,
//     String? endDate,
//   });

//   // Media Uploads
//   Future<Either<CustomDioException, dynamic>> uploadThumbnail(
//     String courseId,
//     String filePath, {
//     ProgressCallback? onProgress,
//   });

//   Future<Either<CustomDioException, dynamic>> uploadLessonVideo(
//     String courseId,
//     String sectionId,
//     String lessonId,
//     String filePath, {
//     ProgressCallback? onProgress,
//     CancelToken? cancelToken,
//   });

//   Future<Either<CustomDioException, dynamic>> uploadLessonPdf(
//     String courseId,
//     String sectionId,
//     String lessonId,
//     String filePath, {
//     ProgressCallback? onProgress,
//     CancelToken? cancelToken,
//   });

//   Future<Either<CustomDioException, dynamic>> uploadMentorImage(
//     String courseId,
//     int index,
//     String filePath, {
//     ProgressCallback? onProgress,
//   });

//   // Get Media URLs
//   Future<Either<CustomDioException, String?>> getLessonVideoUrl(
//     String courseId,
//     String sectionId,
//     String lessonId,
//   );
//   Future<Either<CustomDioException, String?>> getLessonPdfUrl(
//     String courseId,
//     String sectionId,
//     String lessonId,
//   );

//   Future<Either<CustomDioException, EnrollmentStatusResponse>> checkEnrollment(
//     String courseId,
//   );

//   // Student Methods
//   Future<Either<CustomDioException, dynamic>> getCourseCatalog({
//     int page = 1,
//     int limit = 12,
//     String? sort,
//     String? category,
//     String? search,
//   });

//   Future<Either<CustomDioException, dynamic>> getStudentMyCourses({
//     int page = 1,
//     int limit = 10,
//     String? status,
//     String? search,
//   });

//   Future<Either<CustomDioException, dynamic>> submitCourseReview({
//     required String courseId,
//     required int rating,
//     required String reviewText,
//   });

//   Future<Either<CustomDioException, dynamic>> updateCourseReview({
//     required String reviewId,
//     required int rating,
//     required String reviewText,
//   });

//   Future<Either<CustomDioException, EnrollmentStatusResponse>>
//   updateLessonProgress({
//     required String enrollmentId,
//     required String lessonId,
//     bool? completed,
//     int? videoProgress,
//   });

//   Future<Either<CustomDioException, CoursePurchaseResponse>>
//   initiateCoursePurchase(String courseId);

//   Future<Either<CustomDioException, dynamic>> verifyCoursePayment(
//     Map<String, dynamic> data,
//   );

//   Future<Either<CustomDioException, QuizSubmissionResponse>> submitQuizAttempt({
//     required String enrollmentId,
//     required String sectionId,
//     required List<Map<String, dynamic>> answers,
//   });
// }
