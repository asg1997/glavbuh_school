// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lessons_screen_cubit.dart';

enum LessonsScreenStateStatus { loading, loaded, error }

class LessonsScreenState extends Equatable {
  final List<Lesson> lessons;
  final LessonsScreenStateStatus status;
  const LessonsScreenState({
    required this.lessons,
    required this.status,
  });

  factory LessonsScreenState.initial() => const LessonsScreenState(
      lessons: [], status: LessonsScreenStateStatus.loading);

  LessonsScreenState copyWith({
    List<Lesson>? lessons,
    LessonsScreenStateStatus? status,
  }) {
    return LessonsScreenState(
      lessons: lessons ?? this.lessons,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [lessons, status];
}
