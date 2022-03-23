import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/widgets/app/app_state_manager.dart';
import 'package:my_to_do_shopping_list/widgets/pages/settings_page/settings_card_builder.dart';
import 'package:provider/provider.dart';

class SettingsShowOnboardWidget extends StatelessWidget {
  const SettingsShowOnboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateManager = context.read<AppStateManager>();
    final textStyle = Theme.of(context).textTheme.headline3;
    final buttonTextStyle = textStyle?.copyWith(color: Colors.teal);
    return SettingsCardBuilder(
      text: SizedBox(
        child: TextButton(
          onPressed: appStateManager.showOnBoardingScreen,
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Показать подсказки', style: buttonTextStyle),
            ],
          ),
        ),
      ),
      selectWidget: const SizedBox(width: 10),
    );
  }
}
