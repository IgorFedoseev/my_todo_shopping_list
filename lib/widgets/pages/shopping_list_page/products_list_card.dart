import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/app_images.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';

class ProductCardWidget extends StatelessWidget {
  final ShoppingListUnit product;
  final TextDecoration textDecoration;

  ProductCardWidget({
    Key? key,
    required this.product,
  })  : textDecoration =
            product.isTaken ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline3;
    final isTakenTextStyle = textStyle?.copyWith(
      decoration: textDecoration,
      decorationThickness: 3,
    );
    final titleListTextStyle = Theme.of(context).textTheme.headline2;
    final isTakenTitleListTextStyle = titleListTextStyle?.copyWith(
      decoration: textDecoration,
      decorationThickness: 3,
    );
    final isTaken = product.isTaken;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 230.0,
              child: Text(
                ' ${product.name} ',
                style: isTaken ? isTakenTitleListTextStyle : titleListTextStyle,
              ),
            ),
            Text(
              ' ${product.quantity.toString()} ${product.measure} ',
              style: isTaken ? isTakenTextStyle : textStyle,
            ),
            SizedBox(
              height: 28.0,
              width: 30.0,
              child: isTaken ? const Image(image: AppImages.check) : null,
            ),
          ],
        ),
      ),
    );
  }
}
