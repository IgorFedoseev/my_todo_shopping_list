import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product_mock.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget(
      this.products,
      {Key? key,})
      : super(key: key);
  final ShoppingList products;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline3;
    final titleListTextStyle = Theme.of(context).textTheme.headline2;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 200.0,
              child: Text(
                '${products.name}:   ',
                style: titleListTextStyle,
              ),
            ),
            Text(
              '  ${products.quantity.toString()} ${products.measure}',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}