import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';
import 'package:my_to_do_shopping_list/widgets/style/text_style.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget(
      this.product,
      {Key? key,})
      : super(key: key);
  final Product product;

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
                '${product.name}: ',
                fontSize: 18.0,
              ),
            ),
            AppTextStyle(
              '  ${product.quantity.toString()} ${product.measure}',
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}