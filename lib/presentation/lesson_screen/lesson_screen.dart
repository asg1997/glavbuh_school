import 'package:flutter/material.dart';
import 'package:glavbuh_school/domain/entities/lesson.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonScreen extends StatefulWidget {
  LessonScreen({Key? key, required this.lesson}) : super(key: key);

  final Lesson lesson;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        flags: YoutubePlayerFlags(), initialVideoId: 'iLnmTe5Q2Qw');
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Главбух Школа'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.lesson.description,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    player,
                    SizedBox(height: 30),
                    LessonTextWidget(),
                    SizedBox(height: 10),
                    ShowMoreWidget(),
                    SizedBox(height: 30),
                    TestsWidget()
                  ]),
            ),
          ),
        );
      },
      player: YoutubePlayer(
        showVideoProgressIndicator: false,
        controller: _controller,
      ),
    );
  }
}

class TestsWidget extends StatelessWidget {
  const TestsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Тест',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        TestsListView(),
      ],
    );
  }
}

class ShowMoreWidget extends StatelessWidget {
  const ShowMoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
        onPressed: () {},
        child: Text(
          'Подробнее',
          style: TextStyle(decoration: TextDecoration.underline, fontSize: 16),
        ));
  }
}

class LessonTextWidget extends StatelessWidget {
  const LessonTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Мы любим животных и стараемся поддерживать тех из них, кому не посчастливилось иметь ласковых хозяев и тёплый кров. Один из проверенных способов это сделать — помочь приюту для животных Домашний. У этих ребят живёт более 1500 четвероногих, и благодаря их труду ежегодно сотни питомцев находят свой новый дом.',
      style: TextStyle(height: 1.7, fontSize: 16),
    );
  }
}

class TestsListView extends StatelessWidget {
  const TestsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return TestItem();
      },
    );
  }
}

class TestItem extends StatelessWidget {
  const TestItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final answers = [
      'Москва',
      'Изумрудный город под названием самой прекрасной принцессы на свете ',
      'Караганда'
    ];

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(
          'Столица России?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...answers
            .map((e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          side: BorderSide(width: 0),
                          alignment: AlignmentDirectional.centerStart),
                      onPressed: () {},
                      child: Text(
                        e,
                        style: TextStyle(height: 1.7),
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ))
            .toList(),
      ],
    );
  }
}
