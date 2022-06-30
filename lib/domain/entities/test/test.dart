// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:glavbuh_school/domain/entities/answer/answer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'test.g.dart';

@JsonSerializable()
class Test {
  final String question;

  final List<Answer> answers;
  Test({
    required this.question,
    required this.answers,
  });

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
}
