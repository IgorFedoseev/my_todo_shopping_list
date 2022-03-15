import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/navigation/tab_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/home_page.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_manager.dart';
import 'package:my_to_do_shopping_list/widgets/style/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.dark();
    return MaterialApp(
      title: 'To-do shopping list',
      // routes: mainNavigation.route,
      // onGenerateRoute: mainNavigation.onGenerateRoute,
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => ProductListManager()),
        ],
        child: const HomePage(),
      ),
      // TODO: replace with initial route of main screen
    );
  }
}
