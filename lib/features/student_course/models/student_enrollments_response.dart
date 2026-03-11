class StudentEnrollmentsResponse {
  final String status;
  final StudentEnrollmentsData data;

  StudentEnrollmentsResponse({required this.status, required this.data});

  factory StudentEnrollmentsResponse.fromJson(Map<String, dynamic> json) {
    return StudentEnrollmentsResponse(
      status: json['status'] ?? '',
      data: StudentEnrollmentsData.fromJson(json['data'] ?? {}),
    );
  }
}

class StudentEnrollmentsData {
  final List<StudentEnrollment> enrollments;
  final int total;
  final int page;
  final int limit;
  final bool hasMore;

  StudentEnrollmentsData({
    required this.enrollments,
    required this.total,
    required this.page,
    required this.limit,
    required this.hasMore,
  });

  factory StudentEnrollmentsData.fromJson(Map<String, dynamic> json) {
    return StudentEnrollmentsData(
      enrollments: (json['enrollments'] as List? ?? [])
          .map((e) => StudentEnrollment.fromJson(e))
          .toList(),
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 10,
      hasMore: json['hasMore'] ?? false,
    );
  }
}

class StudentEnrollment {
  final String id;
  final EnrolledCourse course;
  final String paymentStatus;
  final double amountPaid;
  final int completionPercent;
  final String status;
  final List<LessonProgress> lessonProgress;
  final DateTime enrolledAt;

  StudentEnrollment({
    required this.id,
    required this.course,
    required this.paymentStatus,
    required this.amountPaid,
    required this.completionPercent,
    required this.status,
    required this.lessonProgress,
    required this.enrolledAt,
  });

  factory StudentEnrollment.fromJson(Map<String, dynamic> json) {
    return StudentEnrollment(
      id: json['_id'] ?? '',
      course: EnrolledCourse.fromJson(json['courseId'] ?? {}),
      paymentStatus: json['paymentStatus'] ?? '',
      amountPaid: (json['amountPaid'] ?? 0).toDouble(),
      completionPercent: json['completionPercent'] ?? 0,
      status: json['status'] ?? '',
      lessonProgress: (json['lessonProgress'] as List? ?? [])
          .map((e) => LessonProgress.fromJson(e))
          .toList(),
      enrolledAt: DateTime.parse(
        json['enrolledAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}

class EnrolledCourse {
  final String id;
  final String title;
  final String category;
  final String difficulty;
  final int totalLessons;
  final String? thumbnailUrl;
  final String creatorName;

  EnrolledCourse({
    required this.id,
    required this.title,
    required this.category,
    required this.difficulty,
    required this.totalLessons,
    this.thumbnailUrl,
    required this.creatorName,
  });

  factory EnrolledCourse.fromJson(Map<String, dynamic> json) {
    return EnrolledCourse(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      difficulty: json['difficulty'] ?? '',
      totalLessons: json['totalLessons'] ?? 0,
      thumbnailUrl: json['thumbnailUrl'],
      creatorName: json['creatorId'] is Map
          ? json['creatorId']['username'] ?? ''
          : '',
    );
  }
}

class LessonProgress {
  final String lessonId;
  final bool completed;
  final int videoProgress;

  LessonProgress({
    required this.lessonId,
    required this.completed,
    required this.videoProgress,
  });

  factory LessonProgress.fromJson(Map<String, dynamic> json) {
    return LessonProgress(
      lessonId: json['lessonId'] ?? '',
      completed: json['completed'] ?? false,
      videoProgress: json['videoProgress'] ?? 0,
    );
  }
}
