import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/products.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final product = Products();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ProductsListTile(
              title: product.label,
              quantity: product.quantity,
              measure: product.measure,
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
    return ListTile(
      title: Text('$title: $quantity $measure'),
    );
  }
}
