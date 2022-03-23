import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_card_builder.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_manager.dart';
import 'package:provider/provider.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = context.read<SettingsManager>();
    final style = Theme.of(context).textTheme.headline3;
    return SettingsCardBuilder(
      text: Text(
        'Тёмная тема',
        style: style,
      ),
      selectWidget: Switch(
        value: manager.darkMode,
        onChanged: (value) => manager.darkMode = value,
      ),
    );
  }
}
