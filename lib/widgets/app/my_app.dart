import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/navigation/main_navigation.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      title: 'To-do shopping list',
      routes: mainNavigation.route,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      theme: theme.copyWith(
        brightness: Brightness.dark,
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.white,
          secondary: Colors.blueGrey[700],
        ),
      ),
      home: const ProductsListWidget(title: 'Список покупок'),
      // TODO: replace with initial route of main screen
    );
  }
}


