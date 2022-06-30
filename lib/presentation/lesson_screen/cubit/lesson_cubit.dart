import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_udid/flutter_udid.dart';

import 'package:glavbuh_school/core/exceptions/exceptions.dart';
import 'package:glavbuh_school/data/tests_service.dart';
import 'package:glavbuh_school/domain/entities/test/test.dart';

part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit() : super(LessonState.initial());
  final testService = TestsService();

  Future<void> getTests(String testUrl) async {
    emit(state.copyWith(status: LessonStateStatus.loading));
    try {
      final udid = await FlutterUdid.udid;
      final urlUdid = testUrl + '?' + udid;
      final test = await testService.getRandomTest(urlUdid);
      emit(state.copyWith(
        status: LessonStateStatus.loaded,
        test: test,
      ));
    } on ServerException {
      emit(state.copyWith(
        status: LessonStateStatus.error,
      ));
    }
  }
}
