import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_card.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_manager.dart';

class ProductsListBuilder extends StatelessWidget {
  final ProductListManager manager;

  const ProductsListBuilder({Key? key, required this.manager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = manager.products;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        final change = !product.isTaken;
        return GestureDetector(
          onTap: () => manager.completeProduct(index, change),
          child: ProductCardWidget(
            key: Key(product.id),
            product: product,
          ),
        );
      },
    );
  }
}
