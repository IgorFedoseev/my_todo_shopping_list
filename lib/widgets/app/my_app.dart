import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/navigation/app_route_parser.dart';
import 'package:my_to_do_shopping_list/navigation/app_router.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shopping_list_page/products_list_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_manager.dart';
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
  final _settingsManager = SettingsManager();
  late AppRouter _appRouter;
  final routeParser = AppRouteParser();

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _appStateManager),
        ChangeNotifierProvider(create: (_) => _productListManager),
        ChangeNotifierProvider(create: (_) => _settingsManager),
      ],
      child: Consumer<SettingsManager>(
        builder: (context, settingsManager, _) {
          ThemeData theme;
          if (settingsManager.darkMode) {
            theme = AppTheme.dark();
          } else {
            theme = AppTheme.light();
          }
          return MaterialApp.router(
            title: 'To-do shopping list',
            theme: theme,
            routerDelegate: _appRouter,
            routeInformationParser: routeParser,
            backButtonDispatcher: RootBackButtonDispatcher(),
          );
        },
      ),
    );
  }
}
