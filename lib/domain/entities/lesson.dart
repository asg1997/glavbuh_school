import 'package:json_annotation/json_annotation.dart';
part 'lesson.g.dart';

@JsonSerializable()
class Lesson {
  final String title;
  final String description;
  final String url;

  Lesson({
    required this.title,
    required this.description,
    required this.url,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
