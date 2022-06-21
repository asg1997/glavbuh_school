import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glavbuh_school/data/lessons_service.dart';
import 'package:glavbuh_school/domain/entities/lesson.dart';

part 'lessons_screen_state.dart';

class LessonsScreenCubit extends Cubit<LessonsScreenState> {
  LessonsScreenCubit() : super(LessonsScreenState.initial());

  final lessonsService = LessonsService();

  Future<void> getLessons() async {
    emit(state.copyWith(status: LessonsScreenStateStatus.loading));

    final lessons = await lessonsService.getLessons();
    emit(state.copyWith(
        status: LessonsScreenStateStatus.loaded, lessons: lessons));
    print(lessons);
  }
}
