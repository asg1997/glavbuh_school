// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lesson_cubit.dart';

enum LessonStateStatus { loading, loaded, error }

class LessonState extends Equatable {
  final LessonStateStatus status;
  final List<Test> tests;
  LessonState({
    required this.status,
    required this.tests,
  });

  factory LessonState.initial() => LessonState(
        status: LessonStateStatus.loading,
        tests: [],
      );
  @override
  List<Object?> get props => [status, tests];

  LessonState copyWith({
    LessonStateStatus? status,
    List<Test>? tests,
  }) {
    return LessonState(
      status: status ?? this.status,
      tests: tests ?? this.tests,
    );
  }
}
