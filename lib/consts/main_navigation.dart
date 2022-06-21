import 'package:flutter/material.dart';
import 'package:glavbuh_school/presentation/lessons_screen.dart';

abstract class AuthRoutes {
  static const lessonScreen = '/lessonScreen';
}

class MainNavigation {
  final initialRoute = AuthRoutes.lessonScreen;

  final routes = <String, Widget Function(BuildContext)>{
    AuthRoutes.lessonScreen: (context) => const LessonsScreen(),
  };
}
