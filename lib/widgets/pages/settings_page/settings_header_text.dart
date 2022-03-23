import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  final String text;
  const HeaderTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerTextStyle = Theme.of(context).textTheme.headline2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        text,
        style: headerTextStyle,
      ),
    );
  }
}