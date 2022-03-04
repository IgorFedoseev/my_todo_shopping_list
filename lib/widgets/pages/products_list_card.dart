import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/style/text_style.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget(
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