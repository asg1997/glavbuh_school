import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:glavbuh_school/core/main_navigation.dart';
import 'package:glavbuh_school/domain/entities/lesson/lesson.dart';
import 'package:glavbuh_school/domain/entities/test/test.dart';
import 'package:glavbuh_school/presentation/lesson_screen/cubit/lesson_cubit.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({Key? key, required this.lesson}) : super(key: key);
  final Lesson lesson;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonCubit()..getTests(lesson.testUrl),
      child: LessonScreenBody(lesson: lesson),
    );
  }
}

class LessonScreenBody extends StatefulWidget {
  LessonScreenBody({Key? key, required this.lesson}) : super(key: key);

  final Lesson lesson;

  @override
  State<LessonScreenBody> createState() => _LessonScreenBodyState();
}

class _LessonScreenBodyState extends State<LessonScreenBody> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        flags: YoutubePlayerFlags(autoPlay: false),
        initialVideoId: YoutubePlayer.convertUrlToId(widget.lesson.videoUrl)!);
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
                    LessonTextWidget(text: widget.lesson.text),
                    SizedBox(height: 10),
                    ShowMoreWidget(url: widget.lesson.url),
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
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
        onPressed: () async {
          final udid = await FlutterUdid.udid;
          final urlUdid = url + '?' + udid;

          Navigator.of(context)
              .pushNamed(AuthRoutes.webviewScreen, arguments: urlUdid);
        },
        child: Text(
          'Подробнее',
          style: TextStyle(decoration: TextDecoration.underline, fontSize: 16),
        ));
  }
}

class LessonTextWidget extends StatelessWidget {
  const LessonTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(height: 1.7, fontSize: 16),
    );
  }
}

class TestsListView extends StatelessWidget {
  const TestsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      builder: (context, state) {
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: state.tests.length,
          itemBuilder: (BuildContext context, int index) {
            return TestItem(test: state.tests[index]);
          },
        );
      },
    );
  }
}

class TestItem extends StatelessWidget {
  const TestItem({Key? key, required this.test}) : super(key: key);
  final Test test;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(
          test.question,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...test.answers
            .map((answer) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          side: BorderSide(width: 0),
                          alignment: AlignmentDirectional.centerStart),
                      onPressed: () async {
                        final udid = await FlutterUdid.udid;
                        final urlUdid = answer.resultUrl + '?' + udid;

                        Navigator.of(context).pushNamed(
                            AuthRoutes.webviewScreen,
                            arguments: urlUdid);
                      },
                      child: Text(
                        answer.answer,
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
