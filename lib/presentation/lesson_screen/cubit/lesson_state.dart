// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lesson_cubit.dart';

enum LessonStateStatus { loading, loaded, error }

class LessonState extends Equatable {
  final LessonStateStatus status;
  final Test test;
  const LessonState({
    required this.status,
    required this.test,
  });

  factory LessonState.initial() => LessonState(
        status: LessonStateStatus.loading,
        test: Test(
          answers: [],
          question: '',
        ),
      );
  @override
  List<Object?> get props => [status, test];

  LessonState copyWith({
    LessonStateStatus? status,
    Test? test,
  }) {
    return LessonState(
      status: status ?? this.status,
      test: test ?? this.test,
    );
  }
}
