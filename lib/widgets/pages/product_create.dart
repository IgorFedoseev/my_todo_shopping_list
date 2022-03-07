import 'package:flutter/material.dart';

class ProductCreateWidget extends StatelessWidget {
  const ProductCreateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline3;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить в список'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Добавить продукт', style: textStyle,),
        ),
      ),
    );
  }
}
