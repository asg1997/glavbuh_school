// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:glavbuh_school/domain/entities/lesson.dart';
import 'package:json_annotation/json_annotation.dart';
part 'lesson_response.g.dart';

@JsonSerializable()
class LessonResponse {
  @JsonKey(fromJson: lessonsFromJson)
  final List<Lesson> lessons;
  LessonResponse({
    required this.lessons,
  });

  static List<Lesson> lessonsFromJson(List<dynamic> json) =>
      json.map((e) => Lesson.fromJson(e)).toList();

  factory LessonResponse.fromJson(Map<String, dynamic> json) =>
      _$LessonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LessonResponseToJson(this);
}
