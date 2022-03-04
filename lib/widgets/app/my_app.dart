import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/products.dart';
import 'package:my_to_do_shopping_list/widgets/pages/product_form.dart';
import 'package:my_to_do_shopping_list/widgets/style/text_style.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      title: 'To-do shopping list',
      theme: theme.copyWith(
        brightness: Brightness.dark,
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.white,
          secondary: Colors.blueGrey,
        ),
      ),
      home: const MyHomePage(title: 'Список покупок'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final product = Products();
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductFormWidget(product: product.label);
                    },
                  ),
                );
              },
              child: ProductsListTile(
                title: product.label,
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

class ProductsListTile extends StatelessWidget {
  const ProductsListTile(
      {Key? key,
      required this.title,
      required this.quantity,
      required this.measure})
      : super(key: key);
  final String title;
  final int quantity;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 200.0,
              child: AppTextStyle(
                '$title: ',
                fontSize: 18.0,
              ),
            ),
            AppTextStyle(
              '  ${quantity.toString()} $measure',
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
