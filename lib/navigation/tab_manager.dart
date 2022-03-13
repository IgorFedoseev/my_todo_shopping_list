import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier{
  int selectedTab = 0;

  void goToTab(int index){
    if(selectedTab == index) return;
    selectedTab = index;
    notifyListeners();
  }
}