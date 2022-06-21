import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:glavbuh_school/domain/entities/lesson_response.dart';

import '../domain/entities/lesson.dart';

class LessonsService {
  final String url = 'https://www.glavbukh.ru/kursy/app/api/lessons_list.json';

  Future<List<Lesson>> getLessons() async {
    // запрос отправляем
    final response = await Dio().get<String>(url);
    // содержимое запроса
    final data = response.data;

    try {
      final jsonString = jsonDecode(data!);
      final lessonResponse = LessonResponse.fromJson(jsonDecode(data));
    } catch (e) {
      print(e);
    }
    return [];
  }
}
