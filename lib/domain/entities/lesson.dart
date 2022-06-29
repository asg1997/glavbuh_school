// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson {
  final String title;
  final String description;
  final String url;
  @JsonKey(name: 'video_url')
  final String videoUrl;
  final String text;
  @JsonKey(name: 'test_url')
  final String testUrl;
  Lesson({
    required this.title,
    required this.description,
    required this.url,
    required this.videoUrl,
    required this.text,
    required this.testUrl,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
