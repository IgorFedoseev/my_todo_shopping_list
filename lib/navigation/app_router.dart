import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';
import 'package:my_to_do_shopping_list/navigation/app_page_paths.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:my_to_do_shopping_list/widgets/app/home_page.dart';
import 'package:my_to_do_shopping_list/widgets/pages/on_boarding_page/onboarding_page.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shoping_list_page/product_create_edit_form.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shoping_list_page/products_list_manager.dart';

class AppRouter extends RouterDelegate
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
        if (!appStateManager.isOnBoardingComplete) OnBoardingPage.page(),
        if (appStateManager.isOnBoardingComplete)
          HomePage.page(appStateManager.getSelectedTab),
        if (productListManager.isCreatingNewProduct)
          ProductCreateEditWidget.page(
            onCreate: (ShoppingList product) {
              productListManager.addCompleteProduct(product);
            },
            onResumeCreating: (ShoppingList product) {
              productListManager.addResumeProduct(product);
            },
            onEdit: (ShoppingList product, int index) {},
            quit: productListManager.completeCreatingProduct,
          ),
        if (productListManager.selectedIndex != -1)
          ProductCreateEditWidget.page(
            originalProduct: productListManager.selectedProduct,
            index: productListManager.selectedIndex,
            onCreate: (ShoppingList product) {},
            onResumeCreating: (ShoppingList product) {},
            onEdit: (ShoppingList product, int index){
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
    if (route.settings.name == AppLink.productCreateEditWidgetPath){
      productListManager.productTapped(-1);
    }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {} // => null;
}
