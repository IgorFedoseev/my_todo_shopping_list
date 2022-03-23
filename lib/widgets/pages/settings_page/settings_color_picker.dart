import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_card_builder.dart';

class ColorPickerWidget extends StatelessWidget {
  final Color color;
  final String text;
  final void Function(Color) changeColor;

  const ColorPickerWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.changeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline3;
    final buttonTextStyle = textStyle?.copyWith(
      color: Colors.teal,
      fontSize: 16,
    );
    return SettingsCardBuilder(
      coloredBox: SizedBox(height: 38, child: ColoredBox(color: color)),
      text: Text(text, style: textStyle),
      selectWidget: TextButton(
        child: Text(
          'выбрать',
          style: buttonTextStyle,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                content: BlockPicker(
                  pickerColor: color,
                  onColorChanged: changeColor,
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                    child: Text(
                      'Сохранить',
                      style: buttonTextStyle,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
