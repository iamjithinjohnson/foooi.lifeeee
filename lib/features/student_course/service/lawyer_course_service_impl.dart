// import 'package:dio/dio.dart';
// import 'package:dartz/dartz.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_analytics_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_purchase_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/quiz_submission_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_reviews_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_earnings_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_students_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_earnings_summary_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_transactions_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/my_courses_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/create_course_request.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/course_detail_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/models/enrollment_status_response.dart';
// import 'package:lejit_app/presentation/lawyer_courses/services/lawyer_course_service.dart';
// import 'package:lejit_app/services/api_service/dio_services.dart';
// import 'package:lejit_app/utils/endpoints.dart';

// class LawyerCourseServiceImpl implements LawyerCourseService {
//   final DioService dioService;

//   LawyerCourseServiceImpl(this.dioService);

//   @override
//   Future<Either<CustomDioException, MyCoursesResponse>> getMyCourses({
//     int page = 1,
//     int limit = 10,
//     String? status,
//     String? search,
//   }) async {
//     try {
//       final queryParams = {
//         'page': page,
//         'limit': limit,
//         if (status != null && status != 'all') 'status': status.toLowerCase(),
//         if (search != null && search.isNotEmpty) 'search': search,
//       };

//       final response = await dioService.request(
//         LawyerCourseEndpoints.myCourses,
//         method: Method.get,
//         queryParam: queryParams,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(MyCoursesResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseDetailResponse>> getCourseDetail(
//     String id,
//   ) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseDetail(id),
//         method: Method.get,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseDetailResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseAnalyticsResponse>>
//   getCourseAnalytics(String id) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseAnalytics(id),
//         method: Method.get,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseAnalyticsResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseReviewsResponse>> getCourseReviews({
//     required String courseId,
//     int page = 1,
//     int limit = 10,
//     String sort = 'newest',
//     int? rating,
//     String? search,
//   }) async {
//     try {
//       final queryParams = {
//         'page': page,
//         'limit': limit,
//         'sort': sort,
//         if (rating != null) 'rating': rating,
//         if (search != null && search.isNotEmpty) 'search': search,
//       };

//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseReviewsByCourse(courseId),
//         method: Method.get,
//         queryParam: queryParams,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseReviewsResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseEarningsResponse>> getCourseEarnings(
//     String courseId, {
//     int page = 1,
//     int limit = 10,
//     String? search,
//     String? status,
//     String? sort,
//   }) async {
//     try {
//       final queryParams = {
//         'page': page,
//         'limit': limit,
//         if (search != null && search.isNotEmpty) 'search': search,
//         if (status != null && status != 'all') 'status': status,
//         if (sort != null) 'sort': sort,
//       };

//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseEarnings(courseId),
//         method: Method.get,
//         queryParam: queryParams,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseEarningsResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseStudentsResponse>> getCourseStudents(
//     String courseId, {
//     int page = 1,
//     int limit = 10,
//     String? search,
//     String? status,
//     String? sort,
//   }) async {
//     try {
//       final queryParams = {
//         'page': page,
//         'limit': limit,
//         if (search != null && search.isNotEmpty) 'search': search,
//         if (status != null && status != 'all') 'status': status,
//         if (sort != null) 'sort': sort,
//       };

//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseStudents(courseId),
//         method: Method.get,
//         queryParam: queryParams,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseStudentsResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseEarningsSummaryResponse>>
//   getCourseEarningsSummary() async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseEarningsSummary,
//         method: Method.get,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseEarningsSummaryResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseTransactionsResponse>>
//   getCourseEarningsTransactions({
//     int page = 1,
//     int limit = 10,
//     String? search,
//     String? startDate,
//     String? endDate,
//   }) async {
//     try {
//       final queryParams = {
//         'page': page,
//         'limit': limit,
//         if (search != null && search.isNotEmpty) 'search': search,
//         if (startDate != null) 'startDate': startDate,
//         if (endDate != null) 'endDate': endDate,
//       };

//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseEarningsTransactions,
//         method: Method.get,
//         queryParam: queryParams,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseTransactionsResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseDetailResponse>> createCourse(
//     CreateCourseRequest request,
//   ) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.courses,
//         method: Method.post,
//         body: request.toJson(),
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseDetailResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> publishCourse(String id) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.publishCourse(id),
//         method: Method.post,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CourseDetailResponse>> updateCourse(
//     String id,
//     CreateCourseRequest request,
//   ) async {
//     try {
//       final response = await dioService.request(
//         '${LawyerCourseEndpoints.courses}/$id',
//         method: Method.put,
//         body: request.toJson(),
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CourseDetailResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> archiveCourse(String id) async {
//     try {
//       final response = await dioService.request(
//         '${LawyerCourseEndpoints.courses}/$id',
//         method: Method.delete,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> unarchiveCourse(String id) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.unarchiveCourse(id),
//         method: Method.post,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> deleteCoursePermanently(
//     String id,
//   ) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.deleteCoursePermanently(id),
//         method: Method.delete,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> uploadThumbnail(
//     String courseId,
//     String filePath, {
//     ProgressCallback? onProgress,
//   }) async {
//     try {
//       final fileName = filePath.split('/').last;
//       final formData = FormData.fromMap({
//         'thumbnail': await MultipartFile.fromFile(filePath, filename: fileName),
//       });

//       final response = await dioService.request(
//         LawyerCourseEndpoints.uploadThumbnail(courseId),
//         method: Method.post,
//         formData: formData,
//         onSendProgress: onProgress,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   Future<Either<CustomDioException, dynamic>> uploadLessonVideo(
//     String courseId,
//     String sectionId,
//     String lessonId,
//     String filePath, {
//     ProgressCallback? onProgress,
//     CancelToken? cancelToken,
//   }) async {
//     try {
//       final fileName = filePath.split('/').last;
//       final formData = FormData.fromMap({
//         'video': await MultipartFile.fromFile(filePath, filename: fileName),
//       });

//       final response = await dioService.request(
//         LawyerCourseEndpoints.uploadLessonVideo(courseId, sectionId, lessonId),
//         method: Method.post,
//         formData: formData,
//         onSendProgress: onProgress,
//         cancelToken: cancelToken,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   Future<Either<CustomDioException, dynamic>> uploadLessonPdf(
//     String courseId,
//     String sectionId,
//     String lessonId,
//     String filePath, {
//     ProgressCallback? onProgress,
//     CancelToken? cancelToken,
//   }) async {
//     try {
//       final fileName = filePath.split('/').last;
//       final formData = FormData.fromMap({
//         'pdf': await MultipartFile.fromFile(filePath, filename: fileName),
//       });

//       final response = await dioService.request(
//         LawyerCourseEndpoints.uploadLessonPdf(courseId, sectionId, lessonId),
//         method: Method.post,
//         formData: formData,
//         onSendProgress: onProgress,
//         cancelToken: cancelToken,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> uploadMentorImage(
//     String courseId,
//     int index,
//     String filePath, {
//     ProgressCallback? onProgress,
//   }) async {
//     try {
//       final fileName = filePath.split('/').last;
//       final formData = FormData.fromMap({
//         'image': await MultipartFile.fromFile(filePath, filename: fileName),
//       });

//       final response = await dioService.request(
//         LawyerCourseEndpoints.uploadMentorImage(courseId, index),
//         method: Method.post,
//         formData: formData,
//         onSendProgress: onProgress,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, String?>> getLessonVideoUrl(
//     String courseId,
//     String sectionId,
//     String lessonId,
//   ) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.getLessonVideoUrl(courseId, sectionId, lessonId),
//         method: Method.get,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(r.data['data']['url'] as String?),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, String?>> getLessonPdfUrl(
//     String courseId,
//     String sectionId,
//     String lessonId,
//   ) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.getLessonPdfUrl(courseId, sectionId, lessonId),
//         method: Method.get,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(r.data['data']['url'] as String?),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, EnrollmentStatusResponse>> checkEnrollment(
//     String courseId,
//   ) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.checkEnrollment(courseId),
//         method: Method.get,
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(EnrollmentStatusResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> getCourseCatalog({
//     int page = 1,
//     int limit = 12,
//     String? sort,
//     String? category,
//     String? search,
//   }) async {
//     try {
//       final queryParams = {
//         'page': page,
//         'limit': limit,
//         if (sort != null) 'sort': sort,
//         if (category != null && category != 'all') 'category': category,
//         if (search != null && search.isNotEmpty) 'search': search,
//       };

//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseCatalog,
//         method: Method.get,
//         queryParam: queryParams,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> getStudentMyCourses({
//     int page = 1,
//     int limit = 10,
//     String? status,
//     String? search,
//   }) async {
//     try {
//       final queryParams = {
//         'page': page,
//         'limit': limit,
//         if (status != null && status != 'all') 'status': status,
//         if (search != null && search.isNotEmpty) 'search': search,
//       };

//       final response = await dioService.request(
//         LawyerCourseEndpoints.studentMyCourses,
//         method: Method.get,
//         queryParam: queryParams,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> submitCourseReview({
//     required String courseId,
//     required int rating,
//     required String reviewText,
//   }) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.courseReviews,
//         method: Method.post,
//         body: {
//           'courseId': courseId,
//           'rating': rating,
//           'reviewText': reviewText,
//         },
//       );
//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, CoursePurchaseResponse>>
//   initiateCoursePurchase(String courseId) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.purchaseCourse,
//         method: Method.post,
//         body: {'courseId': courseId},
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(CoursePurchaseResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> verifyCoursePayment(
//     Map<String, dynamic> data,
//   ) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.verifyPayment,
//         method: Method.post,
//         body: data,
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, dynamic>> updateCourseReview({
//     required String reviewId,
//     required int rating,
//     required String reviewText,
//   }) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.updateReview(reviewId),
//         method: Method.put,
//         body: {'rating': rating, 'reviewText': reviewText},
//       );

//       return response.fold((l) => Left(l), (r) => Right(r.data));
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, EnrollmentStatusResponse>>
//   updateLessonProgress({
//     required String enrollmentId,
//     required String lessonId,
//     bool? completed,
//     int? videoProgress,
//   }) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.updateLessonProgress(enrollmentId),
//         method: Method.put,
//         body: {
//           'lessonId': lessonId,
//           if (completed != null) 'completed': completed,
//           if (videoProgress != null) 'videoProgress': videoProgress,
//         },
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(EnrollmentStatusResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<CustomDioException, QuizSubmissionResponse>> submitQuizAttempt({
//     required String enrollmentId,
//     required String sectionId,
//     required List<Map<String, dynamic>> answers,
//   }) async {
//     try {
//       final response = await dioService.request(
//         LawyerCourseEndpoints.submitQuizAttempt(enrollmentId),
//         method: Method.post,
//         body: {'sectionId': sectionId, 'answers': answers},
//       );

//       return response.fold(
//         (l) => Left(l),
//         (r) => Right(QuizSubmissionResponse.fromJson(r.data)),
//       );
//     } catch (e) {
//       return Left(CustomDioException(message: e.toString()));
//     }
//   }
// }
