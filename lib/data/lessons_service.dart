import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:glavbuh_school/core/exceptions/exceptions.dart';
import 'package:glavbuh_school/domain/entities/lesson_response/lesson_response.dart';

class LessonsService {
  final String url = 'https://www.glavbukh.ru/kursy/app/api/lessons_list2.json';

  Future<LessonResponse> getLessons() async {
    // запрос отправляем
    final response = await Dio(BaseOptions(
            contentType: Headers.formUrlEncodedContentType,
            responseType: ResponseType.json))
        .get<String>(url);
    // содержимое запроса
    var data = response.data!;

    data = data.replaceAll(RegExp(r',\s+}'), '}');

    try {
      final Map<String, dynamic> jsonString = jsonDecode(data);

      final lessonResponse = LessonResponse.fromJson(jsonString);

      return lessonResponse;
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
