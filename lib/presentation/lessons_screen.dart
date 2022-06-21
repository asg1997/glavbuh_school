import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glavbuh_school/presentation/cubit/lessons_screen_cubit.dart';

// import 'package:glavbuh_school/presentation/cubit/lessons_screen_cubit.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonsScreenCubit(),
      child: const LessonsScreenBody(),
    );
  }
}

class LessonsScreenBody extends StatelessWidget {
  const LessonsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<LessonsScreenCubit>().getLessons();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Уроки'),
        backgroundColor: const Color.fromARGB(255, 62, 69, 83),
      ),
      body: const LessonListView(),
    );
  }
}

class LessonListView extends StatelessWidget {
  const LessonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const CardLesson();
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 0.5,
          color: const Color.fromARGB(255, 62, 69, 83),
        );
      },
    );
  }
}

class CardLesson extends StatelessWidget {
  const CardLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '1С Бухгалтерия',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Задача постановки на самом деле очень легкая, вам надо совершить несколько функций, чтобы пройти дальше, для этого нужно немного подумать и все будет ништяк',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          const Icon(Icons.navigate_next_rounded)
        ],
      ),
    );
  }
}
