import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  final String answer;

  @JsonKey(name: 'result_url')
  final String resultUrl;

  Answer(this.answer, this.resultUrl);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
