import 'package:flutter/material.dart';
import 'package:glavbuh_school/presentation/lessons_screen/lessons_screen.dart';
import 'package:glavbuh_school/presentation/webview_screen/webview_screen.dart';

abstract class AuthRoutes {
  static const lessonScreen = '/';
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
