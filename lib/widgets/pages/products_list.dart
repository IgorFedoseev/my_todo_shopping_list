import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_empty_list.dart';
import 'package:my_to_do_shopping_list/widgets/pages/product_create_edit_form.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_builder.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_manager.dart';
import 'package:provider/provider.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tapOnAddButton(context),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: productsScreenList(),
      ),
    );
  }

  Widget productsScreenList() {
    return Consumer<ProductListManager>(
      builder: (context, productListManager, child) {
        if (productListManager.products.isNotEmpty) {
          return ProductsListBuilder(manager: productListManager);
        } else {
          return const ProductsEmptyList();
        }
      },
    );
  }

  void _tapOnAddButton(BuildContext context){
    final manager =
    Provider.of<ProductListManager>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductCreateEditWidget(
          onCreate: (ShoppingList product){
            manager.addProduct(product);
          },
          onEdit: (ShoppingList product){},
        ),
      ),
    );
  }
}

