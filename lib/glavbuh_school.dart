import 'package:flutter/material.dart';
import 'package:glavbuh_school/consts/app_colors.dart';

import 'core/main_navigation.dart';

class GlavbuhSchool extends StatelessWidget {
  GlavbuhSchool({Key? key}) : super(key: key);

  final navigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: navigation.initialRoute,
      onGenerateRoute: navigation.onGenerateRoute,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainColor)),
    );
  }
}
