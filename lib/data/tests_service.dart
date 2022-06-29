import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:glavbuh_school/core/exceptions/exceptions.dart';
import 'package:glavbuh_school/domain/entities/test/test.dart';

class TestsService {
  Future<List<Test>> getTests(String url) async {
    // 10 раз заменить XX в URL на 0...9
    // и 10 раз запарсить каждый тест отдельно?
    // или сразу скопом
    List<Test> tests = [];
    for (var n = 0; n < 10; n++) {
      final newUrl = url.replaceAll('XX', n.toString());
      try {
        final response = await Dio(BaseOptions(
                contentType: Headers.formUrlEncodedContentType,
                responseType: ResponseType.json))
            .get<String>(newUrl);
        var data = response.data;
        if (data == null) return [];
        data = data.replaceAll(RegExp(r',\s+]'), ']');

        final Map<String, dynamic> jsonString = jsonDecode(data);

        final test = Test.fromJson(jsonString);
        tests.add(test);
      } catch (e) {
        print(e);
        throw ServerException();
      }
    }
    return tests;
  }
}
