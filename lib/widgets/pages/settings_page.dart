import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color _highCurrentColor = Colors.red;
  Color _mediumCurrentColor = Colors.yellow;
  Color _lowCurrentColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = Theme.of(context).textTheme.headline2;
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
              headerTextWidget('Тема приложения', headerTextStyle),
              const SizedBox(height: 6),
              darkMode(menuTextStyle),
              const SizedBox(height: 16),
              headerTextWidget('Цвет уровня важности дела', headerTextStyle),
              const SizedBox(height: 6),
              colorPicker(
                color: _highCurrentColor,
                text: 'Высокий',
                labelStyle: menuTextStyle,
                textButtonStyle: textButtonStyle,
              ),
              colorPicker(
                color: _mediumCurrentColor,
                text: 'Средний',
                labelStyle: menuTextStyle,
                textButtonStyle: textButtonStyle,
              ),
              colorPicker(
                color: _lowCurrentColor,
                text: 'Низкий',
                labelStyle: menuTextStyle,
                textButtonStyle: textButtonStyle,
              ),
              const SizedBox(height: 16),
              headerTextWidget('Справка', headerTextStyle),
              const SizedBox(height: 6),
              showOnBoardingPage(textShowOnBoardStyle),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerTextWidget(String text, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget darkMode(TextStyle? style) {
    return settingsCardBuilder(
        text: Text(
          'Тёмная тема',
          style: style,
        ),
        selectWidget: Switch(value: false, onChanged: (value) {}));
  }

  Widget colorPicker(
      {required Color color,
      required String text,
      required TextStyle? labelStyle,
      required TextStyle? textButtonStyle}) {
    return settingsCardBuilder(
      coloredBox: SizedBox(height: 38, child: ColoredBox(color: color)),
      text: Text(text, style: labelStyle),
      selectWidget: TextButton(
        onPressed: () {},
        child: Text(
          'выбрать',
          style: textButtonStyle,
        ),
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
