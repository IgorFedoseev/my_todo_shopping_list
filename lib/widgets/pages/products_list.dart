import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';
import 'package:my_to_do_shopping_list/navigation/main_navigation.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_card.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final product = Product();
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(MainNavigationRouteNames.productsCreate);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                    MainNavigationRouteNames.productsForm,
                    arguments: product.name);
              },
              child: ProductCardWidget(
                title: product.name,
                quantity: product.quantity,
                measure: product.measure,
              ),
            );
          },
        ),
      ),
    );
  }
}
