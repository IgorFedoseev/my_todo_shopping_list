import 'package:flutter/material.dart';

class SettingsManager extends ChangeNotifier{
  bool _darkMode = false;

  Color _highCurrentColor = Colors.red;
  Color _mediumCurrentColor = Colors.yellow;
  Color _lowCurrentColor = Colors.green;

  bool get darkMode => _darkMode;

  set darkMode(bool darkMode){
    _darkMode = darkMode;
    notifyListeners();
  }

  Color get highCurrentColor => _highCurrentColor;
  Color get mediumCurrentColor => _mediumCurrentColor;
  Color get lowCurrentColor => _lowCurrentColor;

  set highCurrentColor(Color color){
    _highCurrentColor = color;
    notifyListeners();
  }

  set mediumCurrentColor(Color color){
    _mediumCurrentColor = color;
    notifyListeners();
  }

  set lowCurrentColor(Color color){
    _lowCurrentColor = color;
    notifyListeners();
  }
}