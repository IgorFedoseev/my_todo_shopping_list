import 'package:flutter/material.dart';

class AppTab{
  static const int shoppingList = 0;
  static const int tasksList = 1;
  static const int settings = 2;
}

class AppStateManager extends ChangeNotifier{
  bool _onBoardingComplete = false;
  int _selectedTab = AppTab.shoppingList;

  bool get isOnBoardingComplete => _onBoardingComplete;
  int get getSelectedTab => _selectedTab;

  void completeOnBoarding(){
    _onBoardingComplete = true;
    notifyListeners();
  }

  void goToTab(int index){
    if(_selectedTab == index) return;
    _selectedTab = index;
    notifyListeners();
  }

  void showOnBoardingScreen(){
    _onBoardingComplete = false;
    notifyListeners();
  }
}