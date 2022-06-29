import 'package:flutter/material.dart';
import 'package:glavbuh_school/presentation/lesson_screen/lesson_screen.dart';
import 'package:glavbuh_school/presentation/lessons_screen/lessons_screen.dart';
import 'package:glavbuh_school/presentation/webview_screen/webview_screen.dart';

import '../domain/entities/lesson.dart';

abstract class AuthRoutes {
  static const lessonsScreen = '/';
  static const lessonScreen = '/lessonScreen';
  static const webviewScreen = '/webviewScreen';
}

class MainNavigation {
  final initialRoute = '/';

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const LessonsScreen());
      case AuthRoutes.webviewScreen:
        return MaterialPageRoute(
            builder: (context) => WebviewScreen(
                  url: routeSettings.arguments as String,
                ));
      case AuthRoutes.lessonScreen:
        final lesson = routeSettings.arguments as Lesson;

        return MaterialPageRoute(
            builder: (context) => LessonScreen(
                  lesson: lesson,
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('Ошибка навигации'),
                  ),
                ));
    }
  }
}
