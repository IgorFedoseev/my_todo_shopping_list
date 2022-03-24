import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shoping_list_page/products_empty_list.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shoping_list_page/products_list_builder.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shoping_list_page/products_list_manager.dart';
import 'package:provider/provider.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final manager = context.read<ProductListManager>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => manager.createNewProduct(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Consumer<ProductListManager>(
          builder: (context, productListManager, child) {
            if (productListManager.products.isNotEmpty) {
              return ProductsListBuilder(manager: productListManager);
            } else {
              return const ProductsEmptyList();
            }
          },
        ),
      ),
    );
  }
}

