import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_manager.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<SettingsManager>(context, listen: true);
    final menuTextStyle = Theme.of(context).textTheme.headline3;
    final textShowOnBoardStyle = menuTextStyle?.copyWith(color: Colors.teal);
    final textButtonStyle = menuTextStyle?.copyWith(
      color: Colors.teal,
      fontSize: 16,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              headerTextWidget('Тема приложения', context),
              const SizedBox(height: 6),
              darkMode(menuTextStyle, manager),
              const SizedBox(height: 16),
              headerTextWidget('Цвет уровня важности дела', context),
              const SizedBox(height: 6),
              colorPicker(
                context,
                color: manager.highCurrentColor,
                text: 'Высокий',
                labelStyle: menuTextStyle,
                textButtonStyle: textButtonStyle,
                changeColor: (color) => manager.highCurrentColor = color,
              ),
              colorPicker(
                context,
                color: manager.mediumCurrentColor,
                text: 'Средний',
                labelStyle: menuTextStyle,
                textButtonStyle: textButtonStyle,
                changeColor: (color) => manager.mediumCurrentColor = color,
              ),
              colorPicker(
                context,
                color: manager.lowCurrentColor,
                text: 'Низкий',
                labelStyle: menuTextStyle,
                textButtonStyle: textButtonStyle,
                changeColor: (color) => manager.lowCurrentColor = color,
              ),
              const SizedBox(height: 16),
              headerTextWidget('Справка', context),
              const SizedBox(height: 6),
              showOnBoardingPage(textShowOnBoardStyle),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerTextWidget(String text, BuildContext context) {
    final headerTextStyle = Theme.of(context).textTheme.headline2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        text,
        style: headerTextStyle,
      ),
    );
  }

  Widget darkMode(TextStyle? style, SettingsManager manager) {
    final darkModeValue = manager.darkMode;
    return settingsCardBuilder(
      text: Text(
        'Тёмная тема',
        style: style,
      ),
      selectWidget: Switch(
        value: darkModeValue,
        onChanged: (value) => manager.darkMode = value,
      ),
    );
  }

  Widget colorPicker(
    BuildContext context, {
    required Color color,
    required String text,
    required TextStyle? labelStyle,
    required TextStyle? textButtonStyle,
    required void Function(Color) changeColor,
  }) {
    return settingsCardBuilder(
      coloredBox: SizedBox(height: 38, child: ColoredBox(color: color)),
      text: Text(text, style: labelStyle),
      selectWidget: TextButton(
        child: Text(
          'выбрать',
          style: textButtonStyle,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: BlockPicker(
                    pickerColor: Colors.white,
                    onColorChanged: changeColor,
                  ),
                  actions: [
                    TextButton(
                      child: Text(
                        'Сохранить',
                        style: textButtonStyle,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        },
      ),
    );
  }

  Widget showOnBoardingPage(TextStyle? style) {
    return settingsCardBuilder(
      text: SizedBox(
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Показать подсказки', style: style),
            ],
          ),
        ),
      ),
      selectWidget: const SizedBox(width: 10),
    );
  }

  Widget settingsCardBuilder(
      {Widget? coloredBox, required Widget text, Widget? selectWidget}) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 8, height: 50),
          SizedBox(
            width: 10.0,
            child: coloredBox,
          ),
          const SizedBox(width: 8),
          Expanded(child: text),
          selectWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
