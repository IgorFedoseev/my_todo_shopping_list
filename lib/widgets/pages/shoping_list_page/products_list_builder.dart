import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shoping_list_page/product_create_edit_form.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shoping_list_page/products_list_card.dart';
import 'package:my_to_do_shopping_list/widgets/pages/shoping_list_page/products_list_manager.dart';

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
        return buildSlidable(product, index, change);
      },
    );
  }

  Slidable buildSlidable(ShoppingList product, int index, bool change) {
    return Slidable(
      key: ObjectKey(product),
      startActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const StretchMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (context){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductCreateEditWidget(
                    originalProduct: product,
                    onCreate: (product) {},
                    onEdit: (product) {
                      manager.editProduct(product, index);
                    },
                  ),
                ),
              );
            },
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const StretchMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (context){
              manager.deleteProduct(index);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => manager.completeProduct(index, change),
        child: ProductCardWidget(
          key: ValueKey(product.id),
          product: product,
        ),
      ),
    );
  }
}
