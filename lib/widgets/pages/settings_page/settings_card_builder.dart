import 'package:flutter/material.dart';

class SettingsCardBuilder extends StatelessWidget {
  final Widget? coloredBox;
  final Widget text;
  final Widget? selectWidget;

  const SettingsCardBuilder(
      {Key? key, this.coloredBox, required this.text, this.selectWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
