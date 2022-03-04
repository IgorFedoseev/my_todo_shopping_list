import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/style/text_style.dart';

class ProductFormWidget extends StatefulWidget {
  const ProductFormWidget({Key? key, required this.product}) : super(key: key);
  final String product;

  @override
  State<ProductFormWidget> createState() => _ProductFormWidgetState();
}

class _ProductFormWidgetState extends State<ProductFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить в список')),
      body: Center(
        child: AppTextStyle(widget.product),
      ),
    );
  }
}
