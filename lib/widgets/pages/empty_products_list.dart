import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/app_images.dart';

class EmptyProductsList extends StatelessWidget {
  const EmptyProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Flexible(
              child: AspectRatio(
                aspectRatio: 1.5 / 1.0,
                child: Image(image: AppImages.emptyTrolley),
              ),
            ),
            const SizedBox(height: 35.0),
            Text(
              ' Список пуст',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 5.0),
            Text(
              'Нажмите "+" для добавления',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
