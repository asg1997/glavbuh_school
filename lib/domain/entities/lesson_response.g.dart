// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonResponse _$LessonResponseFromJson(Map<String, dynamic> json) =>
    LessonResponse(
      lessons: LessonResponse.lessonsFromJson(json['lessons'] as List),
    );

Map<String, dynamic> _$LessonResponseToJson(LessonResponse instance) =>
    <String, dynamic>{
      'lessons': instance.lessons,
    };
