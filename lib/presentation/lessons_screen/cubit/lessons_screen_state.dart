// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lessons_screen_cubit.dart';

enum LessonsScreenStateStatus { loading, loaded, error }

class LessonsScreenState extends Equatable {
  final List<Lesson> lessons;
  final String url;
  final LessonsScreenStateStatus status;
  const LessonsScreenState({
    required this.url,
    required this.lessons,
    required this.status,
  });

  factory LessonsScreenState.initial() => const LessonsScreenState(
      lessons: [], status: LessonsScreenStateStatus.loading, url: '');

  @override
  // TODO: implement props
  List<Object?> get props => [lessons, status, url];

  LessonsScreenState copyWith({
    List<Lesson>? lessons,
    String? url,
    LessonsScreenStateStatus? status,
  }) {
    return LessonsScreenState(
      lessons: lessons ?? this.lessons,
      url: url ?? this.url,
      status: status ?? this.status,
    );
  }
}
