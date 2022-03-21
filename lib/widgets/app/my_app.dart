import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/navigation/app_router.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/home_page.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_manager.dart';
import 'package:my_to_do_shopping_list/widgets/style/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();
  final _productListManager = ProductListManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      productListManager: _productListManager,
    );
  }

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
          ChangeNotifierProvider(create: (context) => _appStateManager),
          ChangeNotifierProvider(create: (context) => _productListManager),
        ],
        child: const HomePage(),
      ),
    );
  }
}
