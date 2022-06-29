import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glavbuh_school/domain/entities/lesson.dart';
import 'package:glavbuh_school/presentation/lessons_screen/cubit/lessons_screen_cubit.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonsScreenCubit()..getLessons(),
      child: const LessonsScreenBody(),
    );
  }
}

class LessonsScreenBody extends StatelessWidget {
  const LessonsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Главбух Школа'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: BlocBuilder<LessonsScreenCubit, LessonsScreenState>(
              builder: (context, state) {
                if (state.status == LessonsScreenStateStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == LessonsScreenStateStatus.error) {
                  return const Center(
                      child: Text('Ошибка сервера, попробуйте позже'));
                }
                return CustomScrollView(slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate(
                    [
                      LessonListView(
                        lessons: state.lessons,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Хочу больше уроков!',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16),
                          ))
                    ],
                  ))
                ]);
              },
            ),
          ),
        ));
  }
}

class LessonListView extends StatelessWidget {
  const LessonListView({Key? key, required this.lessons}) : super(key: key);
  final List<Lesson> lessons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: lessons.length,
      itemBuilder: (BuildContext context, int index) {
        return CardLesson(
          lesson: lessons[index],
          onTap: () {
            context.read<LessonsScreenCubit>().onItemTapped(
                  context,
                  lessons[index],
                );
          },
        );
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
  const CardLesson({Key? key, required this.lesson, required this.onTap})
      : super(key: key);

  final Lesson lesson;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      lesson.description,
                      style: const TextStyle(
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
        ),
      ),
    );
  }
}
