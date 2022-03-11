import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/api_client.dart';
import 'package:my_to_do_shopping_list/domain/entity/product_mock.dart';
import 'package:my_to_do_shopping_list/navigation/main_navigation.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_card.dart';

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ProductsListWidget> createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  late final ApiClient apiClient;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    apiClient = ApiClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(MainNavigationRouteNames.productsCreate);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: apiClient.getProductsList(),
          builder: (context, AsyncSnapshot<ProductMock> snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if (snapshot.hasError){
                // TODO: handle the error
              }
              final products = snapshot.data?.shoppingList ?? [];
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          MainNavigationRouteNames.productsForm,
                          arguments: products[index]);
                    },
                    child: ProductCardWidget(
                      products[index],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
