import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum Method { get, post, put, delete, patch }

class DioService {
  final Dio dio;
  final String baseUrl;

  DioService({required this.baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 2000),
          receiveTimeout: const Duration(seconds: 2000),
          sendTimeout: const Duration(seconds: 2000),
        ),
      ) {
    dio.interceptors.add(DioInterceptor());
  }
  Future<Either<CustomDioException, Response>> request(
    String endpoint, {
    required Method method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParam,
    formData,
    bool isTokenRequired = true,
    String? baseUrl, // Optional base URL override
    bool needCaching = false,
    ResponseType responseType = ResponseType.json,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      debugPrint("DioService: Starting request to $endpoint");
      debugPrint("DioService: Method: $method");

      Response response;
      final options = Options(
        extra: {"isTokenRequired": isTokenRequired},
        responseType: responseType,
      );

      // Determine the effective base URL for this request
      final String effectiveBaseUrl = baseUrl ?? dio.options.baseUrl;
      final String fullUrl = "$effectiveBaseUrl$endpoint";

      final storage = getx.Get.find<GetStorage>();
      final cacheKey = "cache_$fullUrl${queryParam ?? ''}";

      // 🔹 Return saved response for GET requests
      // 🔹 Return saved response for GET requests ONLY if needCaching is true and NO internet
      if (needCaching && method == Method.get) {
        bool hasInternet = await InternetConnection().hasInternetAccess;
        if (!hasInternet) {
          final cachedData = storage.read(cacheKey);
          if (cachedData != null) {
            debugPrint("DioService: Returning cached response for $fullUrl");
            return Right(
              Response(
                requestOptions: RequestOptions(path: endpoint),
                data: cachedData,
                statusCode: 200,
              ),
            );
          }
        }
      }

      switch (method) {
        case Method.post:
          debugPrint("DioService: Making POST request to $fullUrl");
          response = await dio.post(
            fullUrl,
            data: body ?? formData,
            queryParameters: queryParam,
            options: options,
            onSendProgress: onSendProgress,
            cancelToken: cancelToken,
          );
          debugPrint("DioService: POST request completed");
          break;
        case Method.get:
          response = await dio.get(fullUrl, queryParameters: queryParam);
          break;
        case Method.put:
          response = await dio.put(
            fullUrl,
            data: body ?? formData,
            onSendProgress: onSendProgress,
            cancelToken: cancelToken,
          );
          break;
        case Method.delete:
          response = await dio.delete(
            fullUrl,
            data: body ?? formData,
            queryParameters: queryParam,
            cancelToken: cancelToken,
          );
          break;
        case Method.patch:
          response = await dio.patch(
            fullUrl,
            data: body ?? formData,
            queryParameters: queryParam,
            options: options,
            cancelToken: cancelToken,
          );
          break;
      }

      debugPrint(
        "DioService: Request successful, status: ${response.statusCode}",
      );
      // 🔹 Save successful GET responses to cache
      // 🔹 Save successful GET responses to cache if needCaching is enabled
      if (needCaching && method == Method.get && response.statusCode == 200) {
        debugPrint("DioService: Saving response to cache for $fullUrl");
        storage.write(cacheKey, response.data);
      }

      return Right(response);
    } on DioException catch (e) {
      // log("DioService: DioException caught: ${e.message}", name: "DioService");
      debugPrint("DioService: DioException type: ${e.type}");
      return Left(
        CustomDioException(
          message: returnDioErrorMessage(e),
          statusCode: e.response?.statusCode,
          dioException: e,
        ),
      );
    } catch (e) {
      debugPrint("DioService: General exception: ${e.toString()}");
      debugPrint(e.toString());
      return Left(CustomDioException(message: "Network error"));
    }
  }

  Future<Either<CustomDioException, Response>> uploadFilesWithData({
    required String url,
    required List<File> files,
    Map<String, dynamic>? data,
    String? baseUrl,
    bool isEnforcement = false,
  }) async {
    try {
      final Map<String, dynamic> formDataMap = data != null
          ? Map.from(data)
          : {};

      final List<MultipartFile> multipartFiles = [];
      for (final file in files) {
        final fileName = file.path.split('/').last;
        multipartFiles.add(
          await MultipartFile.fromFile(file.path, filename: fileName),
        );
      }

      if (multipartFiles.isNotEmpty) {
        formDataMap['files'] = multipartFiles.length == 1
            ? multipartFiles.first
            : multipartFiles;
      }

      final formData = FormData.fromMap(formDataMap);

      return await request(
        url,
        method: Method.post,
        formData: formData,
        baseUrl: baseUrl,
      );
    } catch (e) {
      return Left(
        CustomDioException(message: 'Failed to upload files: ${e.toString()}'),
      );
    }
  }
}

class DioInterceptor extends Interceptor {
  DioInterceptor();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isTokenRequired = options.extra["isTokenRequired"] ?? true;
    if (isTokenRequired) {
      final storage = getx.Get.find<GetStorage>();
      final token = storage.read('token');
      // log("$token", name: "ACCESS TOKEN");
      final isFormData = options.data is FormData;
      final contentType = isFormData
          ? 'multipart/form-data'
          : 'application/json';
      options.headers.addAll({
        "Content-Type": contentType,
        if (token != null) "Authorization": "Bearer $token",
      });
    } else {
      options.headers.addAll({
        "Content-Type": "application/json; charset=utf-8",
        "Accept": "application/json",
      });
    }

    if (options.data is! FormData) {
      try {
        log(jsonEncode(options.data), name: "Post data");
      } catch (_) {
        log(
          "[Non-encodable body: ${options.data.runtimeType}]",
          name: "Post data",
        );
      }
    } else {
      log("[FormData]", name: "Post data");
    }
    debugPrint("${options.uri}");
    // debugPrint("${options.headers}");
    // debugPrint("Request started at: ${DateTime.now()}");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("${response.statusCode}");
    log(response.realUri.toString(), name: "Response.uri");

    String responseDataLog = "";
    if (response.requestOptions.responseType == ResponseType.bytes) {
      responseDataLog = "Binary data (${(response.data as List).length} bytes)";
    } else {
      try {
        responseDataLog = jsonEncode(response.data);
      } catch (e) {
        responseDataLog = "Could not encode response data: ${e.toString()}";
      }
    }

    log('''
Response.uri: ${response.realUri.toString()}
Response.data: $responseDataLog
''');
    debugPrint("= = = = = = = = = = = = = = = = = = = = = = = = = = = =");
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // log(
    //   "${err.response?.statusCode} ${err.message}",
    //   name: "DioException.Error",
    // );

    log("Error occurred at: ${DateTime.now()}", name: "ErrorTiming");

    // Log the full error response for debugging
    if (err.response?.data != null) {
      late String errMesg;
      try {
        errMesg = jsonEncode(err.response!.data);
      } catch (e) {
        // In release mode, don't expose error details
        errMesg = kReleaseMode ? 'Something went wrong' : e.toString();
      }
      log("Error Response Data: $errMesg", name: "ErrorResponse");
    }

    log(
      "Network issue detected. Retrying with a 1-second delay...",
      name: "Retry",
    );

    // Adding a 1-second delay
    await Future.delayed(const Duration(seconds: 1));
    if (err.response?.statusCode == 401) {
      // ApiUtils.unAuthorizedPageNavigation();
    }
    super.onError(err, handler);
  }
}

class CustomDioException implements Exception {
  final String message;
  final int? statusCode;
  final DioException? dioException;

  CustomDioException({
    required this.message,
    this.statusCode,
    this.dioException,
  });

  @override
  String toString() =>
      'CustomDioException: $message (Status code: $statusCode)';
}

String returnDioErrorMessage(DioException e) {
  // Check for server errors (500+)
  if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
    return "We're experiencing a temporary issue. Please try again in a few moments.";
  }

  String message =
      e.response?.data["message"] ??
      e.response?.data["detail"] ??
      "Oops! Something went wrong";
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      message = "Oops! Connection timeout";
      break;
    case DioExceptionType.sendTimeout:
      message = "Oops! Connection timeout";
      break;

    case DioExceptionType.receiveTimeout:
      message = "Oops! Connection timeout";
      break;

    case DioExceptionType.badCertificate:
      break;

    case DioExceptionType.badResponse:
      break;

    case DioExceptionType.cancel:
      break;

    case DioExceptionType.connectionError:
      message = "Oops! Network error\nPlease check your connectivity";
      break;

    case DioExceptionType.unknown:
      break;
  }
  return message;
}
