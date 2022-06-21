import 'package:dio/dio.dart';

import '../domain/entities/lesson.dart';

class LessonsService {
  final String url = 'https://www.glavbukh.ru/kursy/app/api/lessons_list.json';

  Future<List<Lesson>> getLessons() async {
    // запрос отправляем
    final response = await Dio().get<String>(url);
    // содержимое запроса
    final data = response.data;
    return [];
  }
}
