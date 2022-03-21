import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/home_page.dart';
import 'package:my_to_do_shopping_list/widgets/pages/onboarding_page.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_manager.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final ProductListManager productListManager;
  final AppStateManager appStateManager;
  // TODO: add profileManager

  AppRouter({
    required this.productListManager,
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    productListManager.addListener(notifyListeners);
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    super.dispose();
    productListManager.removeListener(notifyListeners);
    appStateManager.removeListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isOnBoardingComplete) OnBoardingPage.page(),
        if (appStateManager.isOnBoardingComplete)
          HomePage.page(appStateManager.getSelectedTab),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {} // => null;
}
