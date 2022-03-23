import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_color_picker.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_dark_mode.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_header_text.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_show_onboard.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = context.read<SettingsManager>();
    final setManager = context.watch<SettingsManager>();
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
              const SizedBox(height: 66),
              const HeaderTextWidget(text: 'Тема приложения'),
              const SizedBox(height: 6),
              const DarkMode(),
              const SizedBox(height: 16),
              const HeaderTextWidget(text: 'Цвет уровня важности дела'),
              const SizedBox(height: 6),
              ColorPickerWidget(
                color: manager.highCurrentColor,
                text: 'Высокий',
                changeColor: (color) => setManager.highCurrentColor = color,
              ),
              ColorPickerWidget(
                color: manager.mediumCurrentColor,
                text: 'Средний',
                changeColor: (color) => setManager.mediumCurrentColor = color,
              ),
              ColorPickerWidget(
                color: manager.lowCurrentColor,
                text: 'Низкий',
                changeColor: (color) => setManager.lowCurrentColor = color,
              ),
              const SizedBox(height: 16),
              const HeaderTextWidget(text: 'Справка'),
              const SizedBox(height: 6),
              const SettingsShowOnboardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
