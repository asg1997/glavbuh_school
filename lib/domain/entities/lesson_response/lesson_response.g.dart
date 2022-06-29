// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonResponse _$LessonResponseFromJson(Map<String, dynamic> json) =>
    LessonResponse(
      links: (json['links'] as List<dynamic>).map((e) => e as String).toList(),
      lessons: LessonResponse.lessonsFromJson(json['lessons'] as List),
    );

Map<String, dynamic> _$LessonResponseToJson(LessonResponse instance) =>
    <String, dynamic>{
      'lessons': instance.lessons,
      'links': instance.links,
    };
