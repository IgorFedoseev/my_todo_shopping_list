import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/app_images.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';

class ProductCardWidget extends StatelessWidget {
  final ShoppingList product;
  // final Function(bool?)? onTaken;
  final TextDecoration textDecoration;

  ProductCardWidget({
    Key? key,
    required this.product,
    // this.onTaken,
  })  : textDecoration =
            product.isTaken ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline3;
    final titleListTextStyle = Theme.of(context).textTheme.headline2;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 230.0,
              child: Text(
                ' ${product.name}   ',
                style: titleListTextStyle,
              ),
            ),
            Text(
              '  ${product.quantity.toString()} ${product.measure}',
              style: textStyle,
            ),
            SizedBox(
              height: 28.0,
              width: 30.0,
              child: product.isTaken ? const Image(image: AppImages.check) : null,
            ),
          ],
        ),
      ),
    );
  }
}
