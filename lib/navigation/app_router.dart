import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';
import 'package:my_to_do_shopping_list/navigation/app_links.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:my_to_do_shopping_list/widgets/app/home_page.dart';
import 'package:my_to_do_shopping_list/widgets/pages/app_is_not_initialized_screen/splash_screen.dart';
import 'package:my_to_do_shopping_list/widgets/pages/on_boarding_page/onboarding_page.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shopping_list_page/product_create_edit_form.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shopping_list_page/products_list_manager.dart';

class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final ProductListManager productListManager;
  final AppStateManager appStateManager;

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
        if (!appStateManager.isInitialize) SplashScreen.page(),
        if (appStateManager.isInitialize &&
            !appStateManager.isOnBoardingComplete)
          OnBoardingPage.page(),
        if (appStateManager.isOnBoardingComplete)
          HomePage.page(appStateManager.getSelectedTab),
        if (productListManager.isCreatingNewProduct)
          ProductCreateEditWidget.page(
            onCreate: (ShoppingListUnit product) {
              productListManager.addCompleteProduct(product);
            },
            onResumeCreating: (ShoppingListUnit product) {
              productListManager.addResumeProduct(product);
            },
            onEdit: (ShoppingListUnit product, int index) {},
            quit: productListManager.completeCreatingProduct,
          ),
        if (productListManager.selectedIndex != -1)
          ProductCreateEditWidget.page(
            originalProduct: productListManager.selectedProduct,
            index: productListManager.selectedIndex,
            onCreate: (ShoppingListUnit product) {},
            onResumeCreating: (ShoppingListUnit product) {},
            onEdit: (ShoppingListUnit product, int index) {
              productListManager.editProduct(product, index);
            },
            quit: productListManager.completeCreatingProduct,
          ),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == AppLink.productCreateEditWidgetPath) {
      productListManager.productTapped(-1);
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {}
}
