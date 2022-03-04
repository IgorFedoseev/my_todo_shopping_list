import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/style/text_style.dart';

class ProductCreateWidget extends StatelessWidget {
  const ProductCreateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить в список'),
      ),
      body: const SafeArea(
        child: Center(
          child: AppTextStyle('Добавить продукт'),
        ),
      ),
    );
  }
}
