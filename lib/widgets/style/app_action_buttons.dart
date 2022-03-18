import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/style/app_theme.dart';

class AppActionButtons extends StatelessWidget {
  final void Function() completeAddition;
  final void Function() resumeAddition;
  final bool isEditing;
  const AppActionButtons({
    Key? key,
    required this.resumeAddition,
    required this.completeAddition,
    required this.isEditing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildButton(isEditing ? 'Отмена' : 'Добавить', resumeAddition),
        const SizedBox(width: 14),
        buildButton('Готово', completeAddition),
      ],
    );
  }

  Expanded buildButton(String text, void Function() onPressed) {
    return Expanded(
      child: SizedBox(
        child: ElevatedButton(
          child: Text(
            text,
            style: AppTheme.darkTextTheme.headline3,
          ),
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(3.0),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
