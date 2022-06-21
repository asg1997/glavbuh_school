import 'package:flutter/material.dart';

import 'main_navigation.dart';

class GlavbuhSchool extends StatelessWidget {
  GlavbuhSchool({Key? key}) : super(key: key);

  final navigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: navigation.initialRoute,
      routes: navigation.routes,
      onGenerateRoute: navigation.onGenerateRoute,
      themeMode: ThemeMode.light,
    );
  }
}
