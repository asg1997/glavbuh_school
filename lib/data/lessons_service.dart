import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:glavbuh_school/domain/entities/lesson_response.dart';

import '../domain/entities/lesson.dart';

class LessonsService {
  final String url = 'https://www.glavbukh.ru/kursy/app/api/lessons_list2.json';

  Future<List<Lesson>> getLessons() async {
    // запрос отправляем
    final response = await Dio(BaseOptions(
            contentType: Headers.formUrlEncodedContentType,
            responseType: ResponseType.json))
        .get<String>(url);
    // содержимое запроса
    var data = response.data!;

    data = data.replaceAll(RegExp(r',\n\t\t}'), '}');
    try {
      final Map<String, dynamic> jsonString = jsonDecode(data);

      final lessonResponse = LessonResponse.fromJson(jsonString);

      return lessonResponse.lessons;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
