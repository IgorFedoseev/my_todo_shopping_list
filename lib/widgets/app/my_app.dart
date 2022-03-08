import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/navigation/main_navigation.dart';
import 'package:my_to_do_shopping_list/widgets/pages/home_page.dart';
import 'package:my_to_do_shopping_list/widgets/style/app_theme.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light();
    return MaterialApp(
      title: 'To-do shopping list',
      routes: mainNavigation.route,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      theme: theme,
      home: const HomePage(),
      // TODO: replace with initial route of main screen
    );
  }
}


