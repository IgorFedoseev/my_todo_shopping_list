// import 'package:flutter/material.dart';
// import 'package:my_to_do_shopping_list/domain/entity/product.dart';
// import 'package:my_to_do_shopping_list/widgets/pages/product_create.dart';
// import 'package:my_to_do_shopping_list/widgets/pages/product_form.dart';
// import 'package:my_to_do_shopping_list/widgets/pages/products_list.dart';
//
// abstract class MainNavigationRouteNames {
//   static const productsList = 'products_list';
//   static const productsCreate = 'products_list/product_create';
//   static const productsForm = 'products_list/product_form';
// }
//
// class MainNavigation {
//   // final route = <String, Widget Function(BuildContext)>{
//   //   MainNavigationRouteNames.productsCreate: (context) =>
//   //       ProductCreateWidget(),
//   // };
//
//   Route<Object> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case MainNavigationRouteNames.productsForm:
//         final products = settings.arguments as ShoppingList;
//         return MaterialPageRoute(
//           builder: (context) => ProductFormWidget(products: products),
//         );
//       case MainNavigationRouteNames.productsList:
//         final title = settings.arguments as String;
//         return MaterialPageRoute(
//           builder: (context) => ProductsListWidget(title: title),
//         );
//       default:
//         {
//           const widget = Text('Ошибка навигации!');
//           return MaterialPageRoute(builder: (context) => widget);
//         }
//     }
//   }
// }
