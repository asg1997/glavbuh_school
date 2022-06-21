// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:glavbuh_school/domain/entities/lesson.dart';
import 'package:json_annotation/json_annotation.dart';
part 'lesson_response.g.dart';

@JsonSerializable()
class LessonResponse {
  final List<Lesson> lessons;
  LessonResponse({
    required this.lessons,
  });

  factory LessonResponse.fromJson(Map<String, dynamic> json) =>
      _$LessonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LessonResponseToJson(this);
}
