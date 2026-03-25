import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../utils/app_constants.dart';

class BibleAiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openai.com/v1/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<Map<String, dynamic>> ask(String query) async {
    try {
      final response = await _dio.post(
        'chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${AppConstants.bibleApiKey}',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "model": "gpt-5-mini",
          "messages": [
            {"role": "system", "content": AppConstants.bibleAiSystemPrompt},
            {"role": "user", "content": query},
          ],
          "response_format": {"type": "json_object"},
        },
      );

      if (response.statusCode == 200) {
        String content =
            response.data['choices'][0]['message']['content']?.toString() ?? '';
        if (content.isEmpty) {
          throw Exception('Received empty content from AI');
        }

        // Strip markdown code blocks if present
        if (content.startsWith('```')) {
          final lines = content.split('\n');
          if (lines.length > 2) {
            content = lines.sublist(1, lines.length - 1).join('\n');
          }
        }

        log('API Response Content (Stripped): $content');
        final decoded = jsonDecode(content);
        if (decoded is! Map) {
          throw Exception('AI returned invalid JSON format (expected object)');
        }
        return Map<String, dynamic>.from(decoded);
      } else {
        log('API Error Status: ${response.statusCode}');
        log('API Error Data: ${response.data}');
        throw Exception('Failed to connect to OpenAI: ${response.statusCode}');
      }
    } catch (e) {
      print('API Error: $e');
      rethrow;
    }
  }
}
