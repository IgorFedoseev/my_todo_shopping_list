import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/api_client.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';
import 'package:my_to_do_shopping_list/widgets/pages/empty_products_list.dart';
import 'package:my_to_do_shopping_list/widgets/pages/product_create_edit_form.dart';
import 'package:my_to_do_shopping_list/widgets/pages/product_list_manager.dart';
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
        onPressed: () {
          final manager =
              Provider.of<ProductListManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductCreateEditWidget(
                onCreate: (ShoppingList product){
                  manager.addProduct(product);
                  Navigator.pop(context);
                },
                onEdit: (ShoppingList product){},
              ),
            ),
          );
        },
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
          return const ProductsMockList();
        } else {
          return const EmptyProductsList();
        }
      },
    );
  }
}

class ProductsMockList extends StatefulWidget {
  const ProductsMockList({Key? key}) : super(key: key);

  @override
  State<ProductsMockList> createState() => _ProductsMockListState();
}

class _ProductsMockListState extends State<ProductsMockList> {
  late final ApiClient apiClient;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    apiClient = ApiClient();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    //   FutureBuilder(
    //   future: apiClient.getProductsList(),
    //   builder: (context, AsyncSnapshot<ProductMock> snapshot){
    //     if(snapshot.connectionState == ConnectionState.done){
    //       if (snapshot.hasError){
    //         // TODO: handle the error
    //       }
    //       final products = snapshot.data?.shoppingList ?? [];
    //       return ListView.builder(
    //         itemCount: products.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           return GestureDetector(
    //             onTap: () {
    //               Navigator.of(context).pushNamed(
    //                   MainNavigationRouteNames.productsForm,
    //                   arguments: products[index]);
    //             },
    //             child: ProductCardWidget(
    //               products[index],
    //             ),
    //           );
    //         },
    //       );
    //     } else {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );
  }
}
